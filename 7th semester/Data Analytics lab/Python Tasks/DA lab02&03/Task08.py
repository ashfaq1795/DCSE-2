lst1=[input("Please Enter list 1 element: ") for i in range(5)]
lst2=[int(input("Please Enter list 2 element: ")) for i in range(5)]
print("List 1 is :",lst1)
print("List 1 is :",lst2)
dictnry={lst1[i]:lst2[i] for i in range(len(lst1))}
print("The resultent Dictionary is: ",dictnry)