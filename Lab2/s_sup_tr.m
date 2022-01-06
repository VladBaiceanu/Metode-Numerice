function [x] = s_sup_tr(A,b)
%%% Rezolvarea unui sistem determinat superior triunghiular
% INPUTS:
%   A -- matrice aleatoare superior triunghiular? de dimensiune (n,n)
%   b -- vector aleator de dimensiune (n,1)
%
% OUTPUTS:
%   x -- vectorul solu?ie al sistemului de dimensiune (n,1)

%% SOLUTION START %%
    function [x] = s_sup_tr(A,b)

for i = length(b):-1:1
    s = b(i);
    if i < length(b)
        for j = (i+1):length(b)
            s = s-A(i,j)*x(j);
        end
    end
    x(i)=s/A(i,i);
end
x=x';

%% SOLUTION END %%
end

