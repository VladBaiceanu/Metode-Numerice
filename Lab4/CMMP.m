function [x] = CMMP(A,b)
[m,n]=size(A);
[R,U,Beta] = TORT(A);


for k = 1:n
    suma = 0;
    for i = k:m
        suma = suma + U(i,k)*b(i)
    end
    
    tau = suma/Beta(k)
    
    for i = k:m
        b(i) = b(i) - tau * U(i,k);
    end
end

x = s_sup_tr(R(1:n,:),b(1:n));

end