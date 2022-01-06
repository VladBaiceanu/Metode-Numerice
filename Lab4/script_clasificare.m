% Clasificare cu CMMP

% BD 8.09.2018

% date initiale
N1 = 20;        % numar puncte in prima clasa
N2 = 20;        % numar puncte in a doua clasa
ell = 2;        % dimensiunea vectorilor de clasificat (programul functioneaza corect doar pentru ell=2)
tip_clase = 3;  % cum generam clasele (vezi program mai jos)

% genereaza vectorii din cele doua clase
% cv1 si cv2 sunt "centrele" celor doua clase
s1 = 0.2;       % deviatia medie de la centru
s2 = 0.2;
switch tip_clase
  case 1        % un exemplu "frumos"
    c1 = zeros(ell,1);
    c2 = [zeros(ell-1,1); 1];
  case 2        % centre aleatoare, dar opuse fata de origine
    c1 = 0.3*randn(ell,1)+0.1;
    c2 = -c1;
  case 3        % centre aleatoare
    c1 = 0.3*randn(ell,1);
    c2 = 0.3*randn(ell,1);
end
V1 = c1 + s1*randn(ell,N1);   % genereaza vectorii
V2 = c2 + s2*randn(ell,N2);
% deseneaza vectorii din cele doua clase
plot(V1(1,:), V1(2,:), '*r', 'LineWidth', 5, 'MarkerSize', 10)
hold on
plot(V2(1,:), V2(2,:), '*b', 'LineWidth', 6, 'MarkerSize', 10)
% deseneaza axe (TEMA: calculati din date lungimea corecta a axelor astfel
% incat desenul sa fie mai "frumos")

minx = min([V1(1, :), V2(1, :)]);
miny = min([V1(2, :), V2(2, :)]);

maxx = max([V1(1, :), V2(1, :)]);
maxy = max([V1(2, :), V2(2, :)]);

distance = max(abs(maxx - minx),abs(maxy- miny));
plot([0 0], [distance -distance], 'k');
plot([distance -distance], [0 0], 'k');
hold off

% formeaza si rezolva problema CMMP
A = [ V1' ones(N1,1); V2' ones(N2,1) ];
b = [ones(N1,1); -ones(N2,1)];
x = CMMP(A,b);      % aici se rezolva problema CMMP (TEMA: inlocuiti cu functia scrisa la laborator)
c = x(1:ell);
d = x(ell+1);

% deseneaza dreapta c*v + d = 0, care separa planul in cele doua
% semiplane gasite de metoda CMMP
hold on
if abs(c(2)) > abs(c(1))
  plot([-1 1], -1/c(2)*(c(1)*[-1 1] + d), 'g', 'LineWidth', 2)
else
  plot(-1/c(1)*(c(2)*[-1 1] + d), [-1 1], 'g', 'LineWidth', 2)
end
hold on

% Verificam cati vectori de antrenare sunt clasificati corect in fiecare clasa
matrice_confuzie = zeros(2);
for i = 1 : N1          % TEMA: scrieti eficient operatiile de mai jos, folosind sign(c'*V1+d)
  if sign(c'*V1(:,i) + d) == 1
    matrice_confuzie(1,1) = matrice_confuzie(1,1) + 1;
  else
    matrice_confuzie(1,2) = matrice_confuzie(1,2) + 1;
  end
end
for i = 1 : N2
  if sign(c'*V2(:,i) + d) ~= 1
    matrice_confuzie(2,2) = matrice_confuzie(2,2) + 1;
  else
    matrice_confuzie(2,1) = matrice_confuzie(2,1) + 1;
  end
end
matrice_confuzie;

% TEMA: luati un punct v in plan si clasificati-l cu sign(c'*v + d).
% Verificati daca intr-adevar se afla in semiplanul corect.


v = [-0.5 + (0.5 + 0.5)*rand(1,1), -0.5 + (0.5 + 0.5)*rand(1,1)];


plot(v(1), v(2), '*m', 'LineWidth', 5, 'MarkerSize', 10);
hold off
if sign(c'*v' + d) == 1
    fprintf("Semiplan rosu")
else
    fprintf("Semiplan albastru")
end











