function [A] = Ad(A,u,beta)
%% Pasul Ad din HQ(inmultire la dreapta cu un reflector)
% INPUTS:
%   A    -- matricea care se inmulteste (n, n),
%   u    -- vectorul definitoriu al reflectorului (n, 1),   
%   beta -- scalarul definitoriu al reflectorului 
%
% OUTPUT:
%   A    -- matricea care se inmulteste (n, n) 

%% SOLUTION START %%
n = size(A,2);
m = size(A,1);

for i = 1:m
    sum = 0;
    for j = 1:n
        sum = sum + (A(i,j) * u(j));
    end
    t = sum / beta;
    
    for k = 1:n
        A(i,j) = A(i,j) - t * u(j);
    end
end
%% SOLUTION END %%

end