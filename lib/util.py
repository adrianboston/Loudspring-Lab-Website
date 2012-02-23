
def val(dict, key, default=None):
	print dict, key
	if key in dict: #dict.has_key(key): # k in dict ??
		return dict[key]
	else:
		return default

	
def switchon(test, yes, no):
	if test:
		return yes
	else:
		return no