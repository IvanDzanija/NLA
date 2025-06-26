import numpy as np

A = np.array([[6, 4, 0], [4, 8, -4], [0, -4, 10]])
b = np.array([[1, 6, 4]])
b = b.T
x = np.array([[0], [0], [0]])
print(A)
print(b)

for i in range(4):
    r = b - A @ x
    alp = r.T @ r / (r.T @ A @ r)
    print(f"============ITER {i}=======================")
    print(f"ITER {i} params: \n x{i}:\n{x} \n r{i}:\n{r} \n alpha{i}:\n{alp}")
    x = x + alp * r
    print(f"x{i+1} = {x}")

print("======================")
print(f"Konacni x:\n{x}")
