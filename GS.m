% Gram–Schmidt ortogonalizacija
n = 5;
A = rand(n,n);
% Provjera da su svi vektori linearno nezavisni
while rank(A) < n
    A = rand(n,n);
end

ORTO = [];
for j = 1:n
    a_j = A(:, j);
    v = a_j;
    for i = 1:j - 1
        a_i = ORTO(:, i);
        r = dot(a_i, v);
        a_j = a_j - r * a_i;
    end
    a_j = a_j / norm(a_j)
    ORTO = [ORTO, a_j];
end
isOrthogonal = norm(ORTO' * ORTO - eye(n)) < 1e-10;

if isOrthogonal
    disp('GS je uspjesan!');
else
    disp('Nesto je krivo:(');
end