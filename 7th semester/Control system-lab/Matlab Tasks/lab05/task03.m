function dy=task03(t,y)
dy=zeros(5,1);
dy(1)=y(2);
dy(2)=y(3);
dy(3)=y(4);
dy(4)=y(5);
dy(5)=-2*y(5)-24*y(4)-48*y(3)-24*y(2)-20*y(1)-10;
end
