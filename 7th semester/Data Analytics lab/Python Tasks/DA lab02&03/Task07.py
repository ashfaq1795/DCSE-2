lst=[int(input("Please enter number: " )) for x in range(10)]
print("list is: ",lst )
lst_1=[(lst.count(x),x) for x in set(lst)]
#extract the frequency from the tuple(freq,ele)
max_count=max(lst_1)[0]
#print the element if the frequency is equal to maximum count
for ele in lst_1:
   if ele[0]==max_count:
       print("The Most often element in list is : ",ele[1])
