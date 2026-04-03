% 2) naloga
leto = (2007:2022)';
prodaja = [122; 139; 172; 296; 472; 680; 969; 1244; 1423; 1495; 1536; 1556; 1540; 1351; 1433; 1395];

t = leto - 2007; % t bo šel od 0 do 15

% Sestavimo matriko A (vsak člen v funkciji je en stolpec)
A = [ones(size(t)), t, t.^2, t.^3, exp(t/10)];
b = prodaja;

[R, z] = Givens(A, b);

% Ker imamo 5 neznank (c0 do c4), vzamemo prvih 5 vrstic
R_red = R(1:5, 1:5);
z_red = z(1:5);

% Izračunamo koeficiente c
c = R_red \ z_red;

% a)
a_odgovor = norm(b, inf);

% b)
b_odgovor = norm(A, 'fro');

% c)
t_2026 = 2026 - 2007;
napoved = c(1) + c(2)*t_2026 + c(3)*t_2026^2 + c(4)*t_2026^3 + c(5)*exp(t_2026/10);

% d)
d_odgovor = norm(A, 2);

% e)
a_opt = mean(c) / 1000