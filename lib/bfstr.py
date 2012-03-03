import sys

class bfstr:

	def __init__(self):
		self.buffer = []
		
	def __lshift__(self, obj):
		if obj != None: #avoid raising TypeError concatenating str and NoneType
			self.buffer.append(str(obj))
		return self
		
	def __str__(self):
		tmp = ''.join(self.buffer)
		self.buffer = []	# reset buffer here.
		return tmp
	
	def str(self):
		return self.__str__()


nl = '\n'
tb = '\t'
sp = ' '
