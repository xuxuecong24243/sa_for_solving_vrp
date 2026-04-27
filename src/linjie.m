C=xlsread('coordinator',1,'B2:C93'); % C为牛奶配送点的坐标
P=xlsread('total',2,'A2:B141'); % P为两点之间的路线
X=C(:,1); % X为配送点的横坐标
Y=C(:,2); % Y为配送点的纵坐标
L=1./zeros(92); % L为距离矩阵,92表示剔除原点

%A为0-1矩阵，1表示i到j有路
A=zeros(92,92);
for i=1:140
    a=P(i,1);
    b=P(i,2);
    A(a,b)=1;
    A(b,a)=1;
end
A;

%{
for i=1:35
    for j=1:35
        if i==j
            L(i,j)=0;
        end
        if (i==1 && j~=1)
            L(i,j)=sqrt(X(j-1)^2+Y(j-1)^2);
        end
        if (j==1 && i~=1)
            L(i,j)=sqrt(X(i-1)^2+Y(i-1)^2);
        end
    end   
end
%}


for i=1:92
    for j=1:92
        if i==j
            L(i,j)=0
        elseif A(i,j)==1
            L(i,j)=sqrt((X(i)-X(j))^2+(Y(i)-Y(j))^2);
        end
    end
end


[D,path] = floyd(L)

