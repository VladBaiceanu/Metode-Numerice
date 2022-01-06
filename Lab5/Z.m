function [u,beta,x] = Z(x)
%% Algoritmul Z din HQ(calcul elemente definitorii reflector)
% INPUTS:
%   x    -- vector pentru care se calculeaz? reflectorul (n, 1) 
%
% OUTPUT:
%   u    -- vectorul definitor al reflectorului (n, 1) 
%   beta -- scalarul definitor al reflectorului 
%   x    -- vectorul alterat cu zerouri

%% SOLUTION START %%
sum = 0;
n = size(x);

for i = 1:n
    sum = sum + (x(i) * x(i));
end

sig = sign(x(1)) * sqrt(sum);
u(1) = x(1) + sig;

for j = 2:n
    u(j) = x(j);
    x(i) = 0;
end

beta = u(1) * sig;
x(1) = -sig;
%% SOLUTION END %%
end