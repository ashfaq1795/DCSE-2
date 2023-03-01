import random
num1=int(input("Please enter Num1: "))
num2=int(input("Please enter Num2: "))
z=random.randrange(num1,num2)
print("The ranom 3 digits value between two entered values is: ",z)
s=str(z)
result=int(s[0])+int(s[1])+int(s[2])
print("The sum of these 3 digits is: ",result)
