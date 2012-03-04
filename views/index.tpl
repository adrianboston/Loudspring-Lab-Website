<!DOCTYPE html>
<html>
<head>
  <title>{{title}}</title>
	<link href="/static/styles/home.css" media="Screen" rel="stylesheet" type="text/css" />
	<link href="/static/styles/print.css" media="print" rel="stylesheet" type="text/css" />
	<link href="/static/styles/mobile.css" media="Screen" rel="stylesheet" type="text/css" />		
    % include easing.tpl			# include javascript for vgrid and easing
</head>

% import random
% r = "3" # for now str(random.randint(0, 4))
% rotpic = "/static/img/etc/Rotate_img_"+r + ".jpg" # Clearly only .jpgs
% staticpic = "/static/img/etc/MarkOkrafka_BlueSurf_410x325pxrgb72dpi80p.jpg"

<body id="home">
<div id="wrapper">

<div id="header"></div>
<div id="center" class="bloxcontainer">

<div id="branding" class="blox dark">
	<a href="/">
		<div class="header">
			<div class="title">
				<img src="/static/img/Loudspring/Loudspring_Banner_410x45rgb72dpi.png" title="^#169; Loudspring" width="410"></div>
		</div>
</a>
</div>

<div class="blox">
		<div class="content"><div class="image"><img src="{{staticpic}}" title="&#169; MarkOkrafka.com" width="410" height="325"></div>
		</div>
</div>

% #from lib.header import *
% #hdr = sharedheader(posts)

% include sharedheaderblox.tpl posts=posts[:]

% from lib.util import *

<!-- aboutus box -->
% include smallbox.tpl
<!-- adoutus:end -->

<div id="news">
% for post in posts[:]: #use copy
  % type = val(post.meta,'type')
  % if type == 'news': # and pub or draft
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
