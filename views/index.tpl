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
% pic = random.randint(0, 4)

<body id="home" class="img-{{pic}}">
<div id="body-wrapper">

<!-- header -->
%include header.tpl
<!-- header:end -->

% from lib.util import val, switchon

<!-- Leave out menu
<div id="menu">
% for post in posts:
  % type = val(post.meta,'type')
  % if type == 'page':
    <div class="page">
      <div class="page-title"><a href="{{post.locator}}">{{post.meta['title']}}</a></div>
    </div>
   % end 
% end
</div>
-->

<div id="main">

% for post in posts:

  % type = val(post.meta,'type')
  % if type == None or type == 'page': continue
  
  % sizew = 200; sizeh = 180; backgrnd = "" #set defaults for size and background url if needed
  
  % imgfeat = val(post.meta,'image-feat')
  % imgalt = val(post.meta,'image-alt')
  % imgtag = switchon(imgfeat,"img", "nonimg")
  
  % rank = val(post.meta,'rank', "0")
   
    <a href="{{post.locator}}"> <!-- enclosing anchor -->
   
	<!-- post -->
    <div class="post rank-{{rank}} {{imgtag}}">
    
	<!-- title -->
    <div class="post-title">{{post.meta['title']}}</div>

	<!-- image -->
    %if imgfeat: 
      <div class="post-image"><img src="/static/{{imgfeat}}"/></div>
    % end
    %if imgfeat: 
      <div class="post-image-alt"><img src="/static/{{imgalt}}"/></div>
    % end
    
	<!-- summary -->
    <div class="post-summary" >
      {{!post.summary}}
      <div class="post-more-link">
        <a href="{{post.locator}}">...more</a>
      </div>
    </div> <!-- post-summary:end -->

    <!-- meta info -->
    <div class="post-meta">
      <div class="post-date">{{post.date.strftime('%B %d, %Y')}}</div>
      <div class="post-author">{{post.meta['author']}}</div>    	  
    </div>
    
  </div> <!-- post:end -->
  </a> <!-- anchor around post end -->
% end


<!--
<div id="page-navigation">
<div id="prev">{{!'<a href="/'+(str(page-1))+'"><img src="/static/img/Loudspring/REV-icon.png" height="20px"/></a>' if has_prev else 'x'}}</div>
<div id="next">{{!'<a href="/'+(str(page+1))+'"><img src="/static/img/Loudspring/FFWD-icon.png" height="20px"/></a>' if has_next else 'x'}}</div>
</div>
-->

</div>

<!-- footer -->
%include footer.tpl
<!-- footer:end -->

</div>
</body>
</html>
