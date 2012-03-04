% style = val(post.meta, 'style-single')
  
% if style != None:
	<link href="/static/styles/{{post.meta['style-single']}}" media="Screen" rel="stylesheet" type="text/css" />
% else:
  	<link href="/static/styles/single.css" media="Screen" rel="stylesheet" type="text/css" />
% end 
<link href="/static/styles/print.css" media="print" rel="stylesheet" type="text/css" />
<link href="/static/styles/mobile.css" media="Screen" rel="stylesheet" type="text/css" />
