% SOR metoda
A = [45 2 3
    -3 22 2
    5 1 2];

b = [58
    47
    13];

ans = inv(A) * b

n = length(b);
L = tril(A, -1);
D = diag(diag(A));
U = triu(A, 1);

w = 0.9;

Dinv = inv(D);
Ltilda = Dinv * L;
Utilda = Dinv * U;

I = eye(n);
first = inv(I + w * Ltilda);
second = (1-w) * I - w * Utilda;
third = first * Dinv * w * b;

k = 5;
x = zeros(n, 1);                          
X = zeros(n, k + 1);                      
X(:, 1) = x;

for i = 1:k
    x = first * second * x + third
    X(:, i + 1) = x;                      
end