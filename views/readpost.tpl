<!DOCTYPE html>
<html>
<head>
  <title>{{title}}: {{post.meta['title']}}</title>
  
  % if post.meta['style-single']:
	<link href="/static/styles/{{post.meta['style-single']}}" media="Screen" rel="stylesheet" type="text/css" />
  % else:  
    <link href="/static/styles/single.css" media="screen" rel="stylesheet" type="text/css" />
  % end 
	<link href="/static/styles/print.css" media="print" rel="stylesheet" type="text/css" />
	<link href="/static/styles/mobile.css" media="screen" rel="stylesheet" type="text/css" />

</head>

  % if post.meta['type'] == 'page':
    <body id="singlepage">
  % else:
    <body id="singlepost">
  % end
      
<div id="body-wrapper">

<div id="blog-brand"><a href="/">
<div id="blog-title">{{title}}</div>
<div id="blog-image"></div>
</a></div>

<div class="post">
  <div class="post-title">{{post.meta['title']}}</div>
  <div class="post-date">{{post.date.strftime('%B %d, %Y')}}</div>
  <div class="post-author">{{post.meta['author']}}</div>
  <div class="post-body">{{!post.contents}}</div>
</div>

% if disqus_shortname:
<div id="disqus_thread"></div>
<script type="text/javascript">
    var disqus_shortname = '{{disqus_shortname}}';
    var disqus_developer = 1;
    (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
% end

<div id="powered-by">
<small>Powered by <a href="http://www.heroku.com/">heroku</a>.</small>
</div>

</div>

</body>
</html>
