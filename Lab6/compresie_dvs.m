function compresie_dvs(nume_fisier, k)

% INPUTS:
%  nume_fisier - sir de caractere reprezentand numele imaginii
%  k - rangul aproximarii

%% SOLUTION START %%

k = 10;
A = im2double(imread('baboon.bmp'));
r = rank(A)
[U, S, V] = svd(A);
B = U(:, 1:k) * S(1:k, 1:k) * V(:, 1:k);
imshow(B)
imwrite(B, 'poza.bmp')
%% SOLUTION END %%

end