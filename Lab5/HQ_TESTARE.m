%HQ TESTARE

A = rand(5)
[Q,A] = HQ(A)
norm(A - Q'*A*Q)
