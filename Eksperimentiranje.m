% Sprezanje matrice i svojstvena dekompozicija
A = [1, 10, -2
    10, 100, 6
    -2, -6, 10]
rA = rank(A);
dA = det(A);
sA = trace(A);
fprintf('Rank: %d\n', rA);
fprintf('Determinant: %.2f\n', dA);
fprintf('Sum of diagonal elements (Trace): %.2f\n', sA);

[vecs, vals] = eig(A);

T1 = vecs * vals * inv(vecs);
rT1 = rank(T1);
dT1 = det(T1);
sT1 = trace(T1);

% Q i P nisu isti znaci nece biti dobro sprezanje -> sve se mijenja
T2 = (5 * vecs) * vals * inv(vecs);
rT2 = rank(T2);
dT2 = det(T2);
sT2 = trace(T2);

% I dalje je ortogonalni vektor sa svojsvenim vektorima -> isto kao bez
% skaliranja
T3 = (5 * vecs) * vals * inv(5 * vecs);
rT3 = rank(T3);
dT3 = det(T3);
sT3 = trace(T3);

% Sprezanje bilo kojom ortogonalnom matricom -> invarijante se ne mijenjaju
T4 = (5 * vecs) * A * inv(5 * vecs);
rT4 = rank(T4);
dT4 = det(T4);
sT4 = trace(T4);

% Singularna dekompozicija
B = [1,1
    2,-2];
BtB = transpose(B) * B;
BBt = B * transpose(B);

[v,l1] = eig(BtB)
[u,l2] = eig(BBt)
assert (isequal(l1,l2));

singular = diag(sqrt(diag(l1)));

B_decomp = -(u * singular * transpose(v));
assert(isequal(B, B_decomp))

D = [3, 0, 0
    0, 2, 0
    0, 0, 1];
C = vecs * D * transpose(vecs)








