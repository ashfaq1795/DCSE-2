import math
import random

num1=int(input('Enter num1:')) #input num1
num2=int(input("Enter num2:")) #input num2

#addition
add=num1+num2
print("sum of num1 and num2=",add)

#subtraction
sub=num1-num2
print("subtraction of num1 and num2=",sub)

#Multiplication
mul=num1*num2  #we can also call math.pow function.
print("Multiplication of num1 and num2=",mul)

#Division
div=num1/num2
print("Multiplication of num1 and num2=",div)

#modulus
mod=num1%num2
print("modulus=",mod)

#power
pw=num1**num2
print("num1 power num2=",pw)

#max
m=max(num1,num2)
print("max of num1 & num2=",m)

#min
mi=min(num1,num2)
print("min of num1 & num2=",mi)

#square1
sq1=math.sqrt(num1)
print("square root of num1=",sq1)

#square2
sq2=math.sqrt(num2)
print("square root of num2=",sq2)

#log 1
lg1=math.log(num1)
print("log of num1=",lg1)

#log 2
lg2=math.log(num2)
print("log of num2=",lg2)

#sine1
s1=math.sin(num1)
print("sine of num1=",s1)

#sine2
s2=math.sin(num2)
print("sine of num2=",s2)

#cosine1
c1=math.cos(num1)
print("cosine of num1=",c1)

#cosine2
c2=math.cos(num2)
print("cosine of num2=",c2)

#Tangent1
T1=math.tan(num1)
print("Tangent of num1=",T1)

#Tangent2
T2=math.tan(num2)
print("Tangent of num2=",T2) 

#arc sine 1                     (value of input to asin, atan, acos must b/w -1 and 1)
si1=math.asin(s1)
print("arc sine of num1=",si1) 

#sarc sine 2
si2=math.asin(s2)
print("arc sine of num2=",si2) 

#arc cosine 1
ci1=math.acos(c1)
print("arc cosine of num1=",ci1) 

#arc cosine 2
ci2=math.acos(c2)
print("arc cosine of num2=",ci2) 

#arc tangent 1
Ti1=math.atan(T1)
print("arc tangent of num1=",Ti1) 

#arc tangent 2
Ti2=math.atan(T2)
print("arc tangent of num2=",Ti2) 

#concatenation
concat=str(num1)+str(num2)
print("concatenation of num1 and num2: ",concat)

#random
R=random.randrange(num1,num2)
print("random value between num1 and num2: ",R)
