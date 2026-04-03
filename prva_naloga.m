clear
clc
format long

load tocke.mat

x = tocke(:,1);
y = tocke(:,2);
z = tocke(:,3);

A = [x.^2, y.^2, z.^2];
b = ones(length(x), 1);

[Q, R, z1] = Householder(A, b);

u = R(1:3,1:3) \ z1(1:3);

alfa = 1 / sqrt(u(1));
beta = 1 / sqrt(u(2));
gama = 1 / sqrt(u(3));

odg2 = norm(Q, 1);
odg3 = norm(A*u - b);

disp('1. naloga:')
disp('alfa =')
disp(alfa)

disp('beta =')
disp(beta)

disp('gama =')
disp(gama)

disp('odg2 =')
disp(odg2)

disp('odg3 =')
disp(odg3)