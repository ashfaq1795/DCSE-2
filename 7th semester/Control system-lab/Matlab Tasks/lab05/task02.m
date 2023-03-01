function dy=task02(t,y)
dy=zeros(2,1);
dy(1)=y(2);
%(First order derivative is equal to y(2),2nd order is equal to y(3) and so on)
dy(2)=-y(1)*y(1)*y(2)+y(2)-y(1);
%(for higher order derivative we will shift all term to right
%will replace derivative with corresponding function)
end