%% Givensova rotacija
A = [1 2;
     3 4;
     5 6];

b = [7; 8; 9];

[R, z] = Givens(A, b);

disp('--- Matrika R (Givens) ---')
disp(R)

disp('--- Vektor z = Q^T b (Givens) ---')
disp(z)

n = size(A, 2);
x = R(1:n,1:n) \ z(1:n);

disp('--- Resitev x (Givens) ---')
disp(x)

disp('--- Originalni b (Givens) ---')
disp(b)

%% Householderjevo zrcaljenje

A = [1 2;
     3 4;
     5 6];

b = [7; 8; 9];

[Q, R, z] = Householder(A, b);

disp('--- Matrika Q (Householder) ---')
disp(Q)

disp('--- Matrika R (Householder) ---')
disp(R)

disp('--- Vektor z = Q^T b (Householder) ---')
disp(z)

n = size(A, 2);
x = R(1:n,1:n) \ z(1:n);

disp('--- Resitev x (Householder) ---')
disp(x)

%% LU Razcep (kvadratne matrike)

A = [2 1 1;
     4 -6 0;
     -2 7 2];

[L, U] = LUrazcep(A);

disp('--- Matrika A (LU razcep) ---')
disp(A)

disp('--- Matrika L (LU razcep) ---')
disp(L)

disp('--- Matrika U (LU razcep) ---')
disp(U)

%% Razcep Choleskega

A = [4 2 2;
     2 5 1;
     2 1 6];

V = Cholesky(A);

disp('--- Matrika A (Cholesky) ---')
disp(A)

disp('--- Matrika V (Cholesky) ---')
disp(V)


%% QR razcep

A = [1 1;
     1 0;
     0 1];

b = [2; 1; 1];

[Q, R] = QRrazcep(A, 'MGS');

disp('--- Matrika Q (QR razcep) ---')
disp(Q)

disp('--- Matrika R (QR razcep) ---')
disp(R)

z = Q' * b;

disp('--- Vektor z = Q'' * b (QR razcep) ---')
disp(z)

n = size(A, 2);
x = R(1:n,1:n) \ z(1:n);

disp('--- Resitev x (QR razcep) ---')
disp(x)

disp('--- Originalni b (QR razcep) ---')
disp(b)