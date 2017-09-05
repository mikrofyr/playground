#!/usr/bin/env python3

def HelloWorld(count):
  if(count<1):
    return 
  else:
    print("Hello World! %d" % (count))
    HelloWorld(count - 1)


def SumSum(number):
  if(number>10):
    print("Returning %d" %(number))
    return number
  #elif number<50:
  #  return SumSum(number+2) +SumSum(number+3)
  else:
    print("Calling SumSum(%d)" %(number+2))
    value = SumSum(number+2)
    print("Returning with %d,%d" %(value,number))
    return value

#HelloWorld(5)

ret = SumSum(6)
print(ret)
#print("Got %d" %(ret))
