function [A] = inv_gpp(A)
%%% Inversarea unei matrici utilizand eliminarea gaussiana cu pivotare
%%% partiala
% INPUTS:
%   A -- matrice aleatoare de dimensiune (n,n)
% OUTPUTS:
%   A -- matrice de dimensiune (n,n) 

%% SOLUTION START %%
n = length(A);
[U,p] = gpp(A);
A = uinv(U);

for k = n-1:-1:1
    for i = k+1:n
        M(i)=A(i,k)/A(k,k);
    end
    
    for i = 1:k
        sum = 0;
        for l = k+1:n
            sum = sum+A(i,l)*M(l);
        end
        A(i,k) = A(i,k) - sum;
    end
    
    if p(k) ~= k
        for i = 1:n
            A(i,k) = A(i,p(k));
        end
    end
end
%% SOLUTION END %%
end