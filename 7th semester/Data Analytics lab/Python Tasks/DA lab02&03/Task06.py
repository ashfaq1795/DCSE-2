x=(34,"ashfaq",45, 68,"Ahmad")
print(x)
i=int(input("Please enter the index at which you want to update an element: "))
if i>len(x):
    print("Sorry your index is out of range.")
u=input("Please enter updated elemet: ")
y=list(x)     #'tuple' object does not support item assignment
y[i]=u
x=tuple(y);
print("Now the Updated tuple is: ",x)
