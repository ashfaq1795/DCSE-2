function dy=task04(t,y)
dy=zeros(7,1);
dy(1)=y(2);
dy(2)=y(3);
dy(3)=y(4);
dy(4)=y(5);
dy(5)=y(6);
dy(6)=dy(7);
dy(7)=-5*y(7)-20*y(6)-2*y(5)-24*y(4)-48*y(3)-24*y(2)-20*y(1)-10;
end

