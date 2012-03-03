from lib.bfstr import *
from lib.util import *

def sharedheader(post):

if post == None: return ""

bloxsizes = {'small':0, 'wide':1, 'tall':2, 'big':3, 'large':3, 'full':3}

out = bfstr();

for post in posts: 

	type = val(post.meta,'type')
	if type == None or type == 'page': continue
	
	subtitle = val(post.meta,'subtitle')
	title = val(post.meta,'title')
	author = val(post.meta, 'author')	  
	imgfeat = val(post.meta,'image-feat')
	imgtitle = val(post.meta, 'image-title', imgfeat)
	imgtag = switchon(imgfeat,"img", "nonimg")	
	size = val(post.meta,'size', "small")
	rank = 0
	if size in bloxsizes: rank = bloxsizes[size]
	
	sizew = 200 if rank <= 1 else 410
	sizeh = 134 if rank == 0 or rank == 2 else 325
     
    out << '<div class=\"blox size-\"' << size << '>'
	out << '<a href=\"' << post.locator << '">'
   
    out << '<div class=\"post ' << imgtag << '\">'
    
	out << '<div class=\"header\">'
	out << '<div class=\"title\">' << title << '</div>'
	out << <div class=\"subtitle\">' << subtitle << '</div>'
	out << '</div>'
	
	out << '<div class=\"content\">'  
	if imgfeat: 
		out << '<div class=\"image\"><img src=\"' << imgfeat << '\" title="{{!imgtitle}}" width="{{sizew}}" height="{{sizeh}}"/></div>
	    
	out << '<div class=\"summary\">'
	out << !post.summary
	out << '<div class=\"more-link\"><a href=\"' << post.locator << '\">...more</a>'
	out << '</div>'
	out << '</div>'
	out << '<div class=\"tinysummary\" >'
	out << remove_html_tags(post.summary)
	out << '<a href=\"' post.locator << '\"></a>'
	out << '</div>'
    out << '</div>'
    
    out << '<div class=\"footer\">'
	out << '<div class=\"meta\">'
	out << '<div class=\"date\">' << post.date.strftime('%B %d, %Y') << '</div>'
	out << '<div class=\"author\">' << author}} << '</div>'
	out << '</div>'
    out << '</div>'

    out << '</div><!--post:end-->'
	out << '</a><!--anchor:end-->'
	out << '</div> <!--blox-->'

	return out.str()

