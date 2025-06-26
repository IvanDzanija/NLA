import numpy as np

A = np.array([[6, 4, 0], [4, 8, -4], [0, -4, 10]])
b = np.array([[1, 6, 4]])
b = b.T
x = np.array([[0], [0], [0]])
r = b - A @ x
d = r
print(f"ITER 0=======================")
print(f"ITER 0 params: \n x0:\n{x} \n r0:\n{r} \n d0:\n{d}")
for i in range(1, 4):
    help = A @ d
    alp = r.T @ r / (d.T @ help)
    x = x + alp * d
    r1 = r - alp * help
    beta = r1.T @ r1 / (r.T @ r)
    d = r1 + beta * d
    r = r1
    print(f"==========ITER {i}=======================")
    print(f"ITER {i} params: \n x{i}:\n{x}\nr{i}:\n{r}\nalpha{i-1}:\n{alp}")
    print(f"d{i}:\n{d}\nbeta{i}:\n{beta}")

print("=============================")
print(f"Konacni x:\n{x}")
