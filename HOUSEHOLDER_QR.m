% Metoda Householderovih reflektora

n = 8;
% A = [10, 9, 18
%    20, -15, -15
%    20, -12, 51]
A = rand(n,n);
[Q,R] = qr(A);
I = eye(n);

Q_h = eye(n);
R_h = A;
for i = 1:n - 1
    u = R_h(:,i);
    a_i = u(i);
    sgn = sign(a_i);
    ss = 0;
    for j = i:n
        ss = ss + (u(j) * u(j));
    end
    ss = sqrt(ss);
    u(1:i-1) = 0;
    u(i) = a_i + sgn * ss;
    u = 1/sqrt(2 * ss * (ss + norm(a_i))) * u;
    H = I - 2 * u * transpose(u);
    R_h = H * R_h;
    Q_h = Q_h * H;
end
correct_R_h = norm(R - R_h) < 1e-10;
correct_Q_h = norm(Q - Q_h) < 1e-10;

% R_h
% Q_h

if correct_R_h && correct_Q_h
    disp('Uspjesna QR dekompozicija pomocu Householderovih reflektora!');
else
    disp('Nesto je krivo:(');
end