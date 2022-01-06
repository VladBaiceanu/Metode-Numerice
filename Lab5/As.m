function [A] = As(u,beta,A)
%% Pasul As din HQ(inmultire la stanga cu un reflector)
% INPUTS:
%   u    -- vectorul definitoriu al reflectorului (n, 1),   
%   beta -- scalarul definitoriu al reflectorului, 
%   A    -- matricea care se inmulteste (n, n)  
%
% OUTPUT:
%   A    -- matricea care se inmulteste (n, n) 

%% SOLUTION START %%
p = size(A,2);
n = size(A,1);

for i = 1:p
    sum = 0;
    for j = 1:n
        sum = sum + (u(i) * A(i,j));
    end
    t = sum /beta;

    for i = 1:n
        A(i,j) = A(i,j) - (t * u(i));
    end
end
%% SOLUTION END %%

end