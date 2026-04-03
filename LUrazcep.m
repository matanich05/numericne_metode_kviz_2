function [L, U] = LUrazcep(A)
% Vrne LU razcep matrike A

n = size(A, 1);

for k = 1:(n-1)
    D_k = A(k,k);
    for i = (k+1):n
        A(i,k) = A(i,k) / D_k;
        for j = (k+1):n
            A(i,j) = A(i,j) - A(i,k) * A(k,j);
        end
    end
end

L = tril(A,-1) + eye(n);
U = triu(A);

end