% Krilovljevi potprostori

% 1. Metoda najbrzeg spusta
A = [4, 2, -1
    2, 8, 4
    -1, 4, 10];
b = [5
    30
    37];

xk = [0,
    0,
    0];
x1 = [];

K = 15;
for k = 1:K
    x1 = [x1, xk];
    r_k = b - A * xk;
    alpha_k = (r_k' * r_k)/(r_k'*A*r_k);
    xk = xk + alpha_k * r_k;
end
% x

% 2. Metoda konjugiranih gradijenta

x_k = [0,
    0,
    0];
x2 = [];

d_k = b - A * x_k;
r_k = b - A * x_k;
for k = 1:K
    x2 = [x2, x_k];
    alpha_k = (r_k' * r_k)/(d_k'*A*d_k);
    x_k = x_k + alpha_k * d_k;
    r_kp = r_k;
    r_k = r_k - alpha_k * A * d_k;
    beta_k = (r_k' * r_k) / (r_kp' * r_kp);
    d_k = r_k + beta_k * d_k;
end
% x2
    
    



