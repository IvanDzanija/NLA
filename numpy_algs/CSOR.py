import numpy as np
import numpy.linalg as nla

A = np.array([[4.0, -1.0, 0.0], [-1.0, 4.0, -1.0], [0.0, -1.0, 4.0]])
b = np.array([[5.0], [5.0], [5.0]])

om = 1
I = np.identity(3)
D = np.diagonal(A)
D = np.diag(D)
L = np.tril(A) - D
U = np.triu(A) - D

L1 = nla.inv(D) @ L
U1 = nla.inv(D) @ U
x = np.array([[1], [1], [1]])
pom = nla.inv((I + om * L1))
Csor = pom @ ((1 - om) * I - om * U1)
C2 = pom @ nla.inv(D)
i = 1
while True:
    x1 = Csor @ x + C2 @ (om * b)
    print(f"=======ITER {i}=========")
    print(f"x{i}:\n{x1}")
    err = nla.norm(x1 - x)
    print(f"ERR: {err}")
    i = i + 1
    x = x1
    if err < 0.05 or i >= 500:
        break
