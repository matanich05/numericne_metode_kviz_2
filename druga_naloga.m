clear
clc
format long

x = (2007:2022)';
b = [122; 139; 172; 296; 472; 680; 969; 1244; ...
     1423; 1495; 1536; 1556; 1540; 1351; 1433; 1395];

t = x - 2007;

A = [ones(length(t),1), ...
     t, ...
     t.^2, ...
     t.^3, ...
     exp(t/10)];

[R, z] = Givens(A, b);

c = R(1:5,1:5) \ z(1:5);

c0 = c(1);
c1 = c(2);
c2 = c(3);
c3 = c(4);
c4 = c(5);

odg1 = norm(b, inf);
odg2 = norm(A, 'fro');

t2026 = 2026 - 2007;
odg3 = c0 + c1*t2026 + c2*t2026^2 + c3*t2026^3 + c4*exp(t2026/10);

% izracun R^(5)
Rtemp = A;
ztemp = b;
stevec = 0;
R5 = [];

[m, n] = size(A);

for j = 1:min(m,n)
    for i = j+1:m
        if Rtemp(i, j) ~= 0
            a1 = Rtemp(j, j);
            b1 = Rtemp(i, j);

            r = hypot(a1, b1);
            cc = a1 / r;
            ss = b1 / r;

            vrstica_j = Rtemp(j, j:n);
            vrstica_i = Rtemp(i, j:n);

            Rtemp(j, j:n) = cc * vrstica_j + ss * vrstica_i;
            Rtemp(i, j:n) = -ss * vrstica_j + cc * vrstica_i;

            zj = ztemp(j);
            zi = ztemp(i);

            ztemp(j) = cc * zj + ss * zi;
            ztemp(i) = -ss * zj + cc * zi;

            Rtemp(i, j) = 0;

            stevec = stevec + 1;

            if stevec == 5
                R5 = Rtemp;
            end
        end
    end
end

odg4 = norm(R5, 2);

a = sum(c) / 5000;

disp('2. naloga:')
disp('odg1 =')
disp(odg1)

disp('odg2 =')
disp(odg2)

disp('odg3 =')
disp(odg3)

disp('odg4 =')
disp(odg4)

disp('a =')
disp(a)