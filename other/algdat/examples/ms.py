#!/usr/bin/env python3
def msort(x):
	result = []
	if len(x) < 2:
		return x
	mid = int(len(x)/2)
	print("Down %d|%d|%s" %(len(x),mid,x))
	y = msort(x[:mid])
	z = msort(x[mid:])
	while (len(y) > 0) or (len(z) > 0):
		if len(y) > 0 and len(z) > 0:
			if y[0] > z[0]:
				result.append(z[0])
				z.pop(0)
			else:
				result.append(y[0])
				y.pop(0)
		elif len(z) > 0:
			for i in z:
				result.append(i)
				z.pop(0)
		else:
			for i in y:
				result.append(i)
				y.pop(0)
	print("Up %d|%d|%s" %(len(x),mid,result))
	return result

msort([2,4,6,3,2,7,1,0])
