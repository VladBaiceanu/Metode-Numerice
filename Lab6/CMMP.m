function [x] = CMMP(A,b)

[m,n]=size(A);
[R,U,beta]=TORT(A);    

for k=1:n
    s=0;
    for i=k:m
        s=s+U(i,k)*b(i);
    end
    T=s/beta(k);
    for i=k:m
        b(i)=b(i)-T*U(i,k);
    end
end

x=s_sup_tr(R(1:n,:),b(1:n));               


end