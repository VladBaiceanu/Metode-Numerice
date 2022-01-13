function [x] = s_sup_tr(A,b)

for i=length(b):-1:1
    s=b(i);
    if i<length(b)
        for j=(i+1):length(b)
            s=s-A(i,j)*x(j);
        end
    end
    x(i)=s/A(i,i);
end
x=x';

end

