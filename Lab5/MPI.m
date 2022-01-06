function [y] = MPI(A,tol,maxiter,y)
%% Metoda puterii inverse
% INPUTS:
%   A       -- matrice aleatoare de dimensiune (n, n),   
%   tol     -- nivel de tolerant? (0 < tol < 1),
%   maxiter -- numar maxim de iteratii
%   y       -- vector pentru aproximatia initiala(n,1)
%
% OUTPUT:
%   y -- vector propriu normalizat al matricei date (n, 1)


%% SOLUTION START %%

n = size(A,3);

y = y / norm(y);
k = 0;
e = 1;
I = eye(n);

while e > tol
    if k > maxiter
        %disp('S-a atins numarul maxim de iteratii fara a se fi obtinut nivelul prescris al tolerantei');
        break
    end
   
    u = (y') * A * y;
    temp = u * (I - A);
    z = inv(temp) * y;
    
    z  = z / norm(z);
    e = abs(1 - abs((z') * y));
    y = z
    
    k = k + 1;
end
%% SOLUTION END %%

end