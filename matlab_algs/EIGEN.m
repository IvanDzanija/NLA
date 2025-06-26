% Iterativne metode za racunanje svojstvene dekompozicije
A = [1, 10, -2
    10, 100, 6
    -2, -6, 10]
[n,r] = size(A);
I_n = eye(n);

% Tocne vrijednosti za provjeru
[vecs, vals] = eig(A)
eigenVector1 = vecs(:, 1);
eigenValue1 = vals(1);

% Metoda potencija za racunanje dominantnog svojstvenog vektora
current = [1
    0
    0];
% BITNO! Ne postaviti pocetni vektor na 0 -> inace je samo mnozenje s 0
k = 10;
for i = 1:k
    temp = A * current;
    current = temp / norm(temp);
end
% current

% Metoda inverznih iteracija
current = [1
    0
    0];
% BITNO! Ne postaviti pocetni vektor na 0 -> inace je samo mnozenje s 0

% Iskorištavamo teorem o preslikavanju spektra
sigma = 10; 
% Ovo ce amplificirati svojstvenu vrijednost najblizu sigma ->
% 1/(lambda_j-sigma)
A_inv = inv(A - sigma * I_n);
k = 10;
for i = 1:k
    temp = A_inv * current;
    current = temp / norm(temp);
end
% current

% Metoda iteracija potprostora

% Za pocetnu matricu postavi ortogonalnu! Pa ne moramo raditi inicijalnu QR
% dekompoziciju
l = 1;
X = eye(n,l);
[Y, R] = qr(X);

k = 10;
for i = 1:k
    X = A * Y;
    [Y, R] = qr(X);
end
% Y

% Metoda QR iteracija -> svojstvene vrijednosti na dijagonali
B = A;
k = 10;
for i=1:k
    [Q,R] = qr(B);
    B = R * Q;
end
% B

    



