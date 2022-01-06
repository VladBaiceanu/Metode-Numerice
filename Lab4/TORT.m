function [A, U, b] = TORT(A)
[m,n] = size(A);

p = min(m - 1,n);
U = zeros(p);
b = zeros(1,p);  
for k = 1:p;
    suma = 0;
    for i = k:m
        suma = suma + A(i,k) * A(i,k);
    end
    sigma = sign(A(k,k)) * sqrt(suma);
    
    if sigma == 0
        b(k) = 0;
    else
        U(k,k) = A(k,k) + sigma;
        for i = k+1:m
            U(i,k) = A(i,k);  
        end
        
        b(k)= sigma * U(k,k);
        A(k,k) = -sigma;
        
        
        
        for i = k+1:m
            A(i,k) = 0; 
        end
        
        
       
        for j = k+1:n
            suma2 = 0;
            
            for i=k:m
                suma2 = suma2 + U(i,k)*A(i,j); 
            end
            
             tau = suma2/b(k);
            for i = k:m
                A(i,j) = A(i,j)-tau*U(i,k);
            end
            
        end
    end
end

end