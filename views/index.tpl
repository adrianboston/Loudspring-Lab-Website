<!DOCTYPE html>
<html>
<head>
  <title>{{title}}</title>
	<link href="/static/styles/home.css" media="Screen" rel="stylesheet" type="text/css" />
	<link href="/static/styles/print.css" media="print" rel="stylesheet" type="text/css" />
	<link href="/static/styles/mobile.css" media="Screen" rel="stylesheet" type="text/css" />
		
    % include easing.tpl #include javascript for vgrid and easing
</head>

% import random
% r = "3" # for now str(random.randint(0, 4))
% rotpic = "/static/img/etc/Rotate_img_"+r + ".jpg" # Clearly only .jpgs
% static = "/static/img/etc/MarkOkrafka_BlueSurf_410x325pxrgb72dpi80p.jpg"

<body id="home">

<div id="wrapper">

% from lib.util import *

<div id="center">

<!-- branding -->
<div id="branding" class="blox rank-3">
	<a href="/">
		<div class="header">
			<div class="title">
				<img src="/static/img/Loudspring/Loudspring_Banner_410x45rgb72dpi.png" alt="our brand" width="410"></div>
		</div>
		<div class="content">
			<div class="image"><img src="{{static}}" alt="{{rotpic}}" width="410" height="325"></div>
		</div>
</a>
</div>
<!-- branding:end -->

% for post in posts:

	% type = val(post.meta,'type')
	% if type == None or type == 'page': continue
	
	% subtitle = val(post.meta,'subtitle')
	% title = val(post.meta,'title')
	% author = val(post.meta, 'author')
	  
	% imgfeat = val(post.meta,'image-feat')
	% imgalt = val(post.meta,'image-alt')
	% imgtag = switchon(imgfeat,"img", "nonimg")
	
	% rank = int(val(post.meta,'rank', "0"))
	
	% #sizew = 200 if rank <= 1 else 410
	% sizew = 200 if rank <= 1 else 410
	% sizeh = 134 if rank == 0 or rank == 2 else 325
	% # sizeh = 135 if rank == 0 or rank == 2 else 327
     
    <div class="blox rank-{{rank}}">
    
	<a href="{{post.locator}}">
   
    <div class="post {{imgtag}}">	<!-- post -->
    
	<!-- title -->
	<div class="header">
	   <div class="title">{{title}}</div> <!-- title:end -->
	   <div class="subtitle">{{subtitle}}</div> <!-- title:end -->
	</div>
	
	<div class="content">    
		<!-- image -->
	    %if imgfeat: 
		   	<div class="image"><img src="{{imgfeat}}" title="{{imgalt}}" width="{{sizew}}" height="{{sizeh}}"/></div>
	    % end
	    
	    <div class="summary" >	<!-- summary -->
		    {{!post.summary}}
		    <div class="more-link">
		      <a href="{{post.locator}}">...more</a>
		    </div>
	    </div> 				<!-- post-summary:end -->
	   	<div class="tinysummary" >
		    % summ = remove_html_tags(post.summary)
		    {{summ}}
		    <a href="{{post.locator}}">>></a>
	    </div> <!-- tiny-summary:end -->
    </div>
    
    <div class="footer">
	    <div class="meta">  	<!-- meta info -->
		    <div class="date">{{post.date.strftime('%B %d, %Y')}}</div>
		    <div class="author">{{author}}</div>    	  
	    </div> 						<!-- meta info:end -->	    
    </div>

    </div><!-- post:end -->
	</a><!-- anchor around post end -->
	</div>

% end

<!-- header -->
% include smallbox.tpl
<!-- header:end -->

<div id="news">
% for post in posts:
  % type = val(post.meta,'type')
  % if type == 'news':
  	<div class="blox">
  	<a href="{{post.locator}}">
    <div class="news">
      <div class="page-title">{{post.meta['title']}}</div>
    </div>
    </a>
    </div>
   % end
% end
</div>

<!--
<div id="page-navigation">
	<div id="prev">{{!'<a href="/'+(str(page-1))+'"><img src="/static/img/Loudspring/REV-icon.png" height="20" /></a>' if has_prev else 'x'}}</div>
	<div id="next">{{!'<a href="/'+(str(page+1))+'"><img src="/static/img/Loudspring/FFWD-icon.png" height="20"/></a>' if has_next else 'x'}}</div>
</div>
-->

</div>

<!-- footer -->
%include footer.tpl
<!-- footer:end -->

</div>
</body>
</html>
