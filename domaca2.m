% 1) naloga
% a)
load('tocke.mat'); % naloži npr. matriko 'tocke' (n x 3)
X = tocke(:,1); Y = tocke(:,2); Z = tocke(:,3);

A = [X.^2, Y.^2, Z.^2];
b = ones(size(X));

[Q,R,z] = Householder(A, b);

% Vzameš prvih n_neznank (3) vrstic
R_koncni = R(1:3, 1:3);
z_koncni = z(1:3);

% Rešiš sistem (u = [1/alfa^2; 1/beta^2; 1/gama^2])
u = R_koncni \ z_koncni;

% Izračunaš koeficiente
alfa = sqrt(1/u(1));
beta = sqrt(1/u(2));
gama = sqrt(1/u(3));

% b)
norma_Q = norm(Q, 1);

% c)
s_vec = linspace(-pi/2, pi/2, 30);
t_vec = linspace(-pi, pi, 30);
[S, T] = meshgrid(s_vec, t_vec);

% Parametrizacija sferoida
XX = alfa * cos(S) .* cos(T);
YY = beta * cos(S) .* sin(T);
ZZ = gama * sin(S);

% Prva točka iz podatkov
T1 = [X(1), Y(1), Z(1)];

% Izračun razdalj (evklidska razdalja med T1 in vsemi točkami na mreži)
razdalje = sqrt((XX - T1(1)).^2 + (YY - T1(2)).^2 + (ZZ - T1(3)).^2);
min_razdalja = min(razdalje(:));

% risanje
%figure;
%scatter3(X, Y, Z, 'r.'); % Izmerjene točke
%hold on;
%surf(XX, YY, ZZ, 'FaceAlpha', 0.5, 'EdgeColor', 'none'); % Optimalni sferoid
%axis equal;

