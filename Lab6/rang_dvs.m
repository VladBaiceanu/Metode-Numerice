
% Descompunerea valorilor singulare si rangul numeric al numei matrici

% A - matrice aleatoare de dimensiune (m, n)
% B - matrice aleatoare de dimensiune (m, r)
% C - matrice aleatoare de dimensiune (r, n)
% D - matrice aleatoare de dimensiune (m, n)
% sigma - scalar


%% SOLUTION START %%
k = 10;
j = 3;
i = 6;

B = randn(k, i);
C = randn(i, j);
D = randn(k, j);

sigma = 0;
epsilon = sigma * 10;
A = B * C + sigma * D;
[U, S, V] = svd(A)
rang = rank(S)

if rang == i
    disp('Rang = r')
else
    disp('Rang != r')
end
% Descrieti pe scurt ce se intampla cu valorile singulare la cresterea lui sigma.

%Valorile singulare cresc odata cu cresterea lui sigma

% Cum trebuie ales epsilon in ecuatia (6.10) din indrumarul de laborator 
% astfel incat rang(A) sa fie r?

%trebuie ca valorile valorile singulare mici calculate sa fie ignorate,
%valori mai mici decat o toleranta epsilon


%% SOLUTION END %%