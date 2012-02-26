 <!DOCTYPE html>
<html>
<head>
  <title>{{title}}</title>
	<link href="/static/styles/home.css" media="Screen" rel="stylesheet" type="text/css" />
	<link href="/static/styles/sizes.css" media="Screen" rel="stylesheet" type="text/css" />	
	<link href="/static/styles/print.css" media="print" rel="stylesheet" type="text/css" />
	<link href="/static/styles/mobile.css" media="Screen" rel="stylesheet" type="text/css" />
	
    % include easing.tpl #include javascript for vgrid and easing
</head>

% import random
% r = "3" # for now str(random.randint(0, 4))
% rotpic = "/static/img/etc/Rotate_img_"+r + ".jpg" # Clearly only .jpgs
% static = "/static/img/etc/MarkOkrafka_BlueSurf_410x325pxrgb72dpi80p.jpg"

<body id="home">
<div id="body-wrapper">

% from lib.util import *

<div id="center">

<!-- header -->
<a href="/">
<div id="branding">
<div class="title"><img src="/static/img/Loudspring/Loudspring_Banner_410x45rgb72dpi.png" alt="our brand" width="410"></div>
<div class="content">
<img src="{{static}}" alt="{{rotpic}}" width="410" height="325">
</div>
</div>
</a>
<!-- header:end -->

% for post in posts:

  % type = val(post.meta,'type')
  % if type == None or type == 'page': continue
    
  % imgfeat = val(post.meta,'image-feat')
  % imgalt = val(post.meta,'image-alt')
  % imgtag = switchon(imgfeat,"img", "nonimg")
  
  % rank = int(val(post.meta,'rank', "0"))
  
  % sizew = 200 if rank <= 1 else 410
  % sizeh = 135 if rank == 0 or rank == 2 else 325
   
    <a href="{{post.locator}}">
   
    <div class="post rank-{{rank}} {{imgtag}}">	<!-- post -->
    
	<!-- title -->
    <div class="post-title">{{post.meta['title']}}</div> <!-- title:end -->
    
	<!-- image -->
    %if imgfeat: 
      <div class="post-image"><img src="{{imgfeat}}" alt="{{imgalt}}" width="{{sizew}}" height="{{sizeh}}"/></div>
    % end
    
    <div class="post-summary" >	<!-- summary -->
      {{!post.summary}}
      <div class="post-more-link">
        <a href="{{post.locator}}">...more</a>
      </div>
    </div> 						<!-- post-summary:end -->
    
    <div class="post-meta">  	<!-- meta info -->
      <div class="post-date">{{post.date.strftime('%B %d, %Y')}}</div>
      <div class="post-author">{{post.meta['author']}}</div>    	  
    </div> 						<!-- meta info:end -->
    
      <div class="post-tiny" >
        % summ = remove_html_tags(post.summary)
        {{summ}}
        <a href="{{post.locator}}">>></a>
      </div> <!-- post-summary:end -->

  </div><!-- post:end -->
</a> <!-- anchor around post end -->
% end

<!-- header -->
% include smallbox.tpl
<!-- header:end -->



<div id="news">
% for post in posts:
  % type = val(post.meta,'type')
  % if type == 'news':
    <div class="news">
      <div class="page-title"><a href="{{post.locator}}">{{post.meta['title']}}</a></div>
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
