C=xlsread('coordinator',1,'B2:C93');
P=xlsread('total',2,'A2:B141');
X=C(:,1);
Y=C(:,2);

A=zeros(92,92);
for i=1:140
    a=P(i,1);
    b=P(i,2);
    A(a,b)=1;
end
A;
scatter(X,Y,1,'b');
%hold on;

for i=1:92
    for j=1:92
        x1=[X(i),X(j)];
        y1=[Y(i),Y(j)];
        if A(i,j)==1
            plot(x1,y1,'b');
        end
    end
end
plot(C(:,1),C(:,2),'r-')
for i=1:92
   text(X(i),Y(i),num2str(i));
end
