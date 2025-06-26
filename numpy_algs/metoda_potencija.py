import numpy as np
from numpy.linalg import norm


A = np.array([[1, 10, -2], [10, 100, -6], [-2, -6, 10]])
x = np.array([[1], [1], [1]])
y = x / norm(x)
i = 0
print(f"===========ITER {i} ==============================")
print(f"x{i}:\n{x} \ny{i}:\n{y}")
print(A)
while True:
    x1 = A @ y
    y = x1 / norm(x1)
    i = i + 1
    print(f"==========ITER {i} ==============================")
    print(f"x{i}:\n{x1} \ny{i}:\n{y}")
    err = norm(x1 - x)
    print(f"ERR: {err}")
    x = x1
    if err < 0.05:
        break
print(np.linalg.eig(A))
