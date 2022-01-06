%MP testare

A=rand(7);
y=rand(7,1);
tol=10^-8;
maxiter=100;
x=MP(A,tol,maxiter,y)
[V,D]=eig(A);
 norm(abs(V(1:7,1))-abs(x),'fro')