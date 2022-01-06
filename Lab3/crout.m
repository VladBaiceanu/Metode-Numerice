function [A] = crout(A)
%%% Factorizarea Crout

% INPUTS:
%   A -- matrice aleatoare de dimensiune (n,n)
% OUTPUTS:
%   A -- matrice in care triunghiul inferior e suprascris cu partea utila 
%   a matricii inferior triunghiulare L, iar triunghiul superior cu cea a
%   matricii superior triunghiulare U, astfel incat A = L*U


%% SOLUTION START %%

n = length(A);
L = zeros(size(A));
U = zeros(size(A));

for i = 1:n
    A(i,1) = A(i,1);
end

for j = 2:n
    A(1,j)=A(1,j)/A(1,1);
end 

for k = 2:n
    for i = k:n
        sum = 0;
        for l = 1:k-1
            sum = sum + A(i,l)*A(l,j);
        end
        
        A(k,j) = (A(k,j) - sum)/A(k,k)
    end

    if k == n
        return
    end

    for j = k+1:n
        sum = 0;
        for l = 1:k-1
            sum = sum + A(k,l)*A(l,j);
        end
        
        A(k,j) = (A(k,j) - sum)/A(k,k);
    end
end
%% SOLUTION END %%
end