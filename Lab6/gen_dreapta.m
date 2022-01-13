% Script pentru generarea unor puncte corespunzand unui model liniar

% parametrii dreptei
alfa = 2;
beta = 1;
gamma = 1;
x_adevarat = [alfa; beta; gamma];
x_adevarat = x_adevarat / norm(x_adevarat); % normam coeficientii

% generare puncte
m = 20;     % numar puncte
s = 0.3;    % putere zgomot
if abs(alfa) > abs(beta)
  yy = 6*rand(m,1) - 3; %randn(m,1);
  xx = (-gamma - beta*yy)/alfa;
else
  xx = 6*rand(m,1) - 3; %randn(m,1);
  yy = (-gamma - alfa*xx)/beta;
end

% aduna zgomot atat lui xx cat si lui yy!
xx = xx + s*randn(m,1);
yy = yy + s*randn(m,1);

% deseneaza punctele
plot(xx, yy, 'xr', 'LineWidth', 2, 'MarkerSize', 8)
hold on
A = [xx yy ones(20,1)];
[U,S,V] = svd(A);
d = V(:,end);

A = [xx ones(20,1)];
dreapta = CMMP(A,yy);
plot(xx, xx*dreapta(1) + dreapta(2), 'LineWidth', 4);
hold on
plot(xx, -1/d(2) * (d(1) * xx + d(3)), 'LineWidth',4);
hold on
plot(xx, -1/x_adevarat(2)*(xx*x_adevarat(1) + x_adevarat(3)), 'LineWidth',2);
hold off

legend('esantioane','adevar','CMMP','CMMPT')
