%QR TESTARE

x = [7, 9, -2, 1]
A = diag(x)
B = randn(4)
A = inv(B) * A * B
maxiter = 100
tol = 10^-15
H = QR(A, tol, maxiter)
norm(diag(H))-norm(x)