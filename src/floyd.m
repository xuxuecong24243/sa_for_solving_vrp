function [D,path,minl,pathl] = floyd(a,start,terminal)
D = a;
n = size(D,1);
path = zeros(n,n);
for i = 1:n
    for j = 1:n
        if D(i,j) ~= inf
        path(i,j) = j;
        end
    end
end
for k = 1:n
    for i = 1:n
        for j = 1:n
            if D(i,k) + D(k,j) < D(i,j)
                D(i,j) = D(i,k) + D(k,j);
                path(i,j) = path(i,k);
            end
        end
    end
end
if nargin == 3
    minl = D(start,terminal);
    m(1) = start;
    i = 1;
    pathl = [];
    while path(m(i),terminal);
        k = i + 1;
        m(k) = path(m(i),terminal);
        i = i + 1;
    end
    m(i + 1) = terminal;
    pathl = m;
end
