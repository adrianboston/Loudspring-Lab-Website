<!DOCTYPE html>
<html>
<head>
  <title>{{title}}: {{post.meta['title']}}</title>
  
  % from lib.util import val

  % style = val(post.meta, 'style-single')
  % if style != None:
	<link href="/static/styles/{{post.meta['style-single']}}" media="Screen" rel="stylesheet" type="text/css" />
  % else:
    <link href="/static/styles/single.css" media="Screen" rel="stylesheet" type="text/css" />
  % end 
	<link href="/static/styles/print.css" media="print" rel="stylesheet" type="text/css" />
	<link href="/static/styles/mobile.css" media="Screen" rel="stylesheet" type="text/css" />
	
	% include easing.tpl
</head>

	% type = val(post.meta,'type', "post")

	% imgfeat = val(post.meta,'image-feat')
	% imgtitle = val(post.meta, 'image-title', imgfeat)
	
	% import random
	% pic = random.randint(0, 4)
	
	% if type == 'page':
	  <body id="singlepage">
	% else:
	  <body id="singlepost">
	% end

	<div id="wrapper">

	<div id="center"> <!-- main -->

	<!-- branding -->
	<div id="branding" class="blox rank-3">
		<a href="/">
			<div class="header">
				<div class="title">
					<img src="/static/img/Loudspring/Loudspring_Banner_410x45rgb72dpi.png" alt="our brand" width="410"></div>
			</div>
			<div class="content">
			% if imgfeat:
				<div class="image"><img src="{{imgfeat}}" title="{{!imgtitle}}" width="410" height="325"></div>
			%else:
				<div id="image"><img src="/static/img/Loudspring/Loudspring_Banner_trans410x48pxrgb72dpi.png" title="our brand" width="410"></div>
			%end
			</div>
	</a>
	</div>
	<!-- branding:end -->

	% subtitle = val(post.meta,'subtitle')
	% title = val(post.meta,'title')
	% author = val(post.meta, 'author')

	<div id="post" class="blox rank-post">
		<div class="header">
		   <div class="title">{{title}}</div> <!-- title:end -->
		   <div class="subtitle">{{subtitle}}</div> <!-- title:end -->
		</div>
		<div class="content">
		  <div class="contents">{{!post.contents}}</div>
		</div>
		<div class="footer">
		    <div class="meta">  	<!-- meta info -->
			    <div class="date">{{post.date.strftime('%B %d, %Y')}}</div>
			    <div class="author">{{author}}</div>    	  
		    </div> 						<!-- meta info:end -->	    
	    </div>
	</div> <!-- blox:end -->

	% blox = val(post.meta, 'blox')
	% if blox:
		% bloxlst = blox.split(';')	#splitup csv into list
		% for b in bloxlst:
			% kv = b.split(',')	#splitup csv into tupl
			% k = kv[0].split(':')
			% c = kv[1].split(':')
			<div id="etc" class="blox rank-{{k[1]}}">
				<div class="content">
				  <div class="contents">{{!c[1]}}</div>
				</div>
			</div>
		% end
	% end
	
	</div> <!-- main:end -->

	% iscomment = val(post.meta,'comment')
	% if iscomment and disqus_shortname:
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
