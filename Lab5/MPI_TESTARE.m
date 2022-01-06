%MPI TESTARE

A = rand(5);
y = rand(5,1);
tol = 10^-8;
maxiter = 100;
[V,D] = eig(A);
x = MPI(A, tol, maxiter, y)
norm(abs(V(1:5,1)) - abs(x),'fro')
