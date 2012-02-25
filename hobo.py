###############################################################################
#     Copyright (c) 2012 Andrew Nelder.  Licensed under the MIT License.      #
#                  See LICENSE.txt for full details.                          #
###############################################################################


# I M P O R T S ###############################################################


import logging
import re
import os
import datetime
from collections import namedtuple

import blog_config
from lib.markdown2 import markdown
from lib.bottle import route, run, view, template, error, static_file, abort

from lib.util import val


# I N I T I A L I Z A T I O N #################################################

# Named tuple pseudo-class
BlogPost = namedtuple('BlogPost', 'date, meta, summary, contents, locator')

# Logger
ch = logging.StreamHandler()
ch.setLevel(logging.DEBUG)
LOGGER = logging.getLogger()
LOGGER.addHandler(ch)

# Regular Expressions
RE_VALID_FILE_EXTENSIONS = re.compile(r'''(?:.md|.markdown|.txt)$''')

# Constants
POSTS = {}
KEY_LIST = []

# Configuration Parameters w/ Defaults
TITLE = blog_config.TITLE \
        if hasattr(blog_config, 'TITLE') else ''
SUBTITLE = blog_config.SUBTITLE \
        if hasattr(blog_config, 'SUBTITLE') else ''
AUTHOR = blog_config.AUTHOR \
        if hasattr(blog_config, 'AUTHOR') else ''
METADATA_TAGS = blog_config.METADATA_TAGS \
        if hasattr(blog_config, 'METADATA_TAGS') else ['title', 'author']
POSTS_PER_PAGE = blog_config.POSTS_PER_PAGE \
        if hasattr(blog_config, 'POSTS_PER_PAGE') else 15
SUMMARY_DELIMITER = blog_config.SUMMARY_DELIMITER \
        if hasattr(blog_config, 'SUMMARY_DELIMITER') else '~~'
USE_HEROKU = blog_config.USE_HEROKU \
        if hasattr(blog_config, 'USE_HEROKU') else True
DISQUS_SHORTNAME = blog_config.DISQUS_SHORTNAME \
        if hasattr(blog_config, 'DISQUS_SHORTNAME') else ''
USE_WSGI = blog_config.USE_WSGI \
        if hasattr(blog_config, 'USE_WSGI') else False 
BLOGIMAGE = blog_config.BLOGIMAGE \
        if hasattr(blog_config, 'BLOGIMAGE') else ''        


# F U N C T I O N S ###########################################################


def process_blog_posts():
    '''
    Migrates the text files contained in the 'posts' directory to the database.
    These files will have their meta-data removed and their markdown
    interpreted and converted to HTML.

    NOTE: This is only run once -- when the server starts.
    '''

    # Open every blog post
    path = 'posts/'
    for input_file in os.listdir(path):
        if RE_VALID_FILE_EXTENSIONS.search(input_file):

            # Extract date from filename
            try:
                (yy, mm, dd) = input_file.split('-')[:3]
                yy = int('20' + yy) if len(yy) is 2 else int(yy)
                mm = int(mm)
                dd = int(dd)
            except:
                LOGGER.warning('Ignoring file <%s>.  Invalid formatting.' %
                        (input_file,))
                continue

            # Validate date
            if yy > 2500 or mm > 12 or dd > 31:
                LOGGER.warning('Ignoring file <%s>.  Invalid date range.' %
                        (input_file,))
                continue

            # Open the file
            file_handle = open(path + input_file, 'r')
            contents = file_handle.read().decode('utf-8')

            # Find the slug
            slug = input_file.split('-', 3)[-1]
            slug = RE_VALID_FILE_EXTENSIONS.sub('', slug)

            # Extract metadata
            meta = {'title': slug, 'author': AUTHOR}
            for tag in METADATA_TAGS:
                re_meta = re.compile(r'''(?:\:%s )(.*?)[\n\r]''' % tag)
                if re_meta.search(contents):
                    meta[tag] = re_meta.findall(contents)[0]
                    contents = re_meta.sub('', contents)

            # Strip the contents of supurfluous whitespace -- now that the
            # metatags have been removed.
            contents = contents.strip()

            # Populate the summary
            # Look for the SUMMARY_DELIM character sequence and use it to
            # form the summary, if it exists.  Otherwise, simply take the first
            # paragraph of the post.
            summary = None
            if re.search(SUMMARY_DELIMITER, contents):  # Use delimiter
                summary = contents.split(SUMMARY_DELIMITER)[0]
                contents = re.sub(SUMMARY_DELIMITER, '', contents)
            else:                                   # Use first paragraph
                summary = re.split(r'''[\r\n]{2}''', contents)[0]
            html_summary = markdown(summary)

            locator = '/%04d/%02d/%02d/%s' % (yy, mm, dd, slug, )

            # Enter the file into the database
            html_contents = markdown(contents)
            POSTS[locator] = \
                BlogPost(\
                    date=datetime.date(yy, mm, dd),\
                    meta=meta,\
                    summary=html_summary,\
                    contents=html_contents,\
                    locator=locator\
                    )

            # Remove the file
            file_handle.close()

    KEY_LIST.extend(POSTS.keys())
    KEY_LIST.sort(reverse=True)


# P A G E   R O U T I N G #####################################################


@route('/')
@route('/<page:int>')
@view('index')
def index(page=0):

    posts = [POSTS[key] for key in \
            KEY_LIST[page * POSTS_PER_PAGE:(page + 1) * POSTS_PER_PAGE]]

    return {'title': TITLE,
            'subtitle': SUBTITLE,
            'page': page,
            'posts': posts,
            'has_prev': (page > 0),
            'has_next': (len(POSTS) > (page + 1) * POSTS_PER_PAGE)}


@route('/<yy:int>/<mm:int>/<dd:int>/<slug>')
@view('readpost')
def readpost(yy, mm, dd, slug):
    locator = '/%04d/%02d/%02d/%s' % (yy, mm, dd, slug, )
    if locator not in POSTS:
        abort(404, 'Article not found!')
    post = POSTS[locator]
    return {'title': TITLE,
            'post': post,
            'disqus_shortname': DISQUS_SHORTNAME}


@route('/files/<filepath:path>')
@route('/static/<filepath:path>')
def server_static(filepath):
    return static_file(filepath, root='files')


@route('/favicon.ico')
def favicon():
    return static_file('favicon.ico', root='files')


@error(403)
@view('error')
def error403(code=None):
    return {'code': code}


@error(404)
@view('error')
def error404(code=None):
    return {'code': code}


# E X E C U T I O N ###########################################################

process_blog_posts()
if USE_HEROKU:
	run(host="0.0.0.0", port=int(os.environ.get("PORT", 80)))
elif USE_WSGI:
	os.chdir(os.path.dirname(__file__)) 	 
else:
	run(host="localhost", port=8080)


# E N D   O F   F I L E #######################################################

