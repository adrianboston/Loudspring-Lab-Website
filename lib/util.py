
def val(dict, key, default=None):
	#print dict, key
	if key in dict: #dict.has_key(key): # k in dict ??
		return dict[key]
	else:
		return default

# return first or second value depending if test is valid
def switchon(test, yes, no):
	if test != None:
		return yes
	else:
		return no

import re
	
def remove_html_tags(data):
    p = re.compile(r'<.*?>')
    return p.sub('', data)
    		
def remove_extra_spaces(data):
    p = re.compile(r'\s+')
    return p.sub(' ', data)	
    
    	