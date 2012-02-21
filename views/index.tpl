<!DOCTYPE html>
<html>
<head>
  <title>{{title}}</title>
	<link href="/static/styles/home.css" media="screen" rel="stylesheet" type="text/css" />
	<link href="/static/styles/print.css" media="print" rel="stylesheet" type="text/css" />
	<link href="/static/styles/mobile.css" media="screen" rel="stylesheet" type="text/css" />
</head>

<body id="home">
<div id="body-wrapper">

<div id="blog-brand"><a href="/">
<div id="blog-title">{{title}}</div>
<div id="blog-image"></div>
<div id="blog-title">{{subtitle}}</div>
</a></div>

<div id="menu">
% for post in posts:
  % if post.meta['type'] == 'page': # skip over posts
  
    <div class="page">
      <div class="page-title"><a href="{{post.locator}}">{{post.meta['title']}}</a></div>
    </div>
   % end 
% end
</div>


% for post in posts:

  % if post.meta['type'] == 'page': continue # skip over those marked, type=page

  % sizew = 200; sizeh = 180; backgrnd = "" #set defaults for size and background url if needed  
  
  % if post.meta['image-feat']: imgFeat = "/static/" + post.meta['image-feat']
  % if imgFeat: backgrnd = "background:url(" + imgFeat + ")" + " top left no-repeat"
  % if post.meta['image-alt']: imgAlt = "/static/" + post.meta['image-alt']
  % if imgAlt: backgrndAlt = "background:url('" + imgAlt + "')" + " top left no-repeat"
  
  % if post.meta['size']: 
    % sizew = int(post.meta['size']) * sizew
    % sizeh = int(post.meta['size']) * sizeh
  %end  
  
    <a href="{{post.locator}}"> <!-- enclosing anchor -->
   
<!--    <div class="post" style="width:{{sizew}}px; height:{{sizeh}}px; {{backgrnd}}"> -->
<!-- post -->
	
    <div class="post" style="width:{{sizew}}px; height:{{sizeh}}px;">
    
	<!-- title -->
    <div class="post-title">{{post.meta['title']}}
<!--      <a style="width:{{sizew}}px; height:{{sizeh}}px; display:block" href="{{post.locator}}">{{post.meta['title']}}</a>-->
    </div>

	<!-- image -->
    <div class="post-image"><img src="{{imgFeat}}"/></div>
    
	<!-- summary -->
    <div class="post-summary">
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

<div id="page-navigation">
<div id="prev">{{!'<a href="/'+(str(page-1))+'">Previous</a>' if has_prev else 'Previous'}}</div>
<div id="next">{{!'<a href="/'+(str(page+1))+'">Next</a>' if has_next else 'Next'}}</div>
</div>


<div id="footer">
</div>

<div id="powered-by">
<small>Powered by <a href="http://www.heroku.com/">heroku</a>.</small>
</div>

</div>
</body>
</html>
