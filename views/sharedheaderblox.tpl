
% from lib.util import *
% bloxsizes = {'small':0, 'wide':1, 'tall':2, 'big':3, 'large':3, 'full':3}
% for post in posts: 

	% type = val(post.meta,'type')
	% if type == None or type == 'page': continue
	
	% subtitle = val(post.meta,'subtitle')
	% title = val(post.meta,'title')
	% author = val(post.meta, 'author')	  
	% imgfeat = val(post.meta,'image-feat')
	% imgtitle = val(post.meta, 'image-title', imgfeat)
	% imgtag = switchon(imgfeat,"img", "nonimg")	
	% size = val(post.meta,'size', "small")
	% rank = 0
	% if size in bloxsizes: rank = bloxsizes[size]
	
	% sizew = 200 if rank <= 1 else 410
	% sizeh = 134 if rank == 0 or rank == 2 else 325
     
    <div class="blox size-{{size}}">    
	<a href="{{post.locator}}">
   
    <div class="post {{imgtag}}">	<!-- post -->
    
	<div class="header">
		<div class="title">{{title}}</div>
		<div class="subtitle">{{subtitle}}</div>
	</div>
	
	<div class="content">    
		<!-- image -->
	    %if imgfeat: 
		   	<div class="image"><img src="{{imgfeat}}" title="{{!imgtitle}}" width="{{sizew}}" height="{{sizeh}}"/></div>
	    % end
	    
	    <div class="summary">
		    {{!post.summary}}
		    <div class="more-link">
		      <a href="{{post.locator}}">...more</a>
		    </div>
	    </div>
	   	<div class="tinysummary" >
		    % summ = remove_html_tags(post.summary)
		    {{summ}}
		    <a href="{{post.locator}}">>></a>
	    </div>
    </div>
    
    <div class="footer">
	    <div class="meta">  	<!-- meta info -->
		    <div class="date">{{post.date.strftime('%B %d, %Y')}}</div>
		    <div class="author">{{author}}</div>    	  
	    </div> 						<!-- meta info:end -->	    
    </div>

    </div><!--post:end-->
	</a><!--anchor:end-->
	</div> <!--blox-->
% end
