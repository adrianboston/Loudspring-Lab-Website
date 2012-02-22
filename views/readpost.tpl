<!DOCTYPE html>
<html>
<head>
  <title>{{title}}: {{post.meta['title']}}</title>
  
  % if post.meta['style-single']:
	<link href="/static/styles/{{post.meta['style-single']}}" media="Screen" rel="stylesheet" type="text/css" />
  % else:
    <link href="/static/styles/single.css" media="Screen" rel="stylesheet" type="text/css" />
  % end 
	<link href="/static/styles/print.css" media="print" rel="stylesheet" type="text/css" />
	<link href="/static/styles/mobile.css" media="Screen" rel="stylesheet" type="text/css" />

</head>

  % imgFeat = "";
  % if post.meta['image-feat']: imgFeat = "/static/" + post.meta['image-feat']


  % if post.meta['type'] == 'page':
    <body id="singlepage">
  % else:
    <body id="singlepost">
  % end

  <div id="body-wrapper">

<!-- header -->
%include header.tpl
<!-- header:end -->

<div class="post">
  <div class="post-title">{{post.meta['title']}}</div>
  <div class="post-date">{{post.date.strftime('%B %d, %Y')}}</div>
  <div class="post-author">{{post.meta['author']}}</div>
  <div class="post-body">{{!post.contents}}</div>
  <div class="post-image"><img src="{{imgFeat}}"/></div>
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

<!-- footer -->
%include footer.tpl
<!-- footer:end -->

</div>

</body>
</html>
