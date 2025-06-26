import numpy as np
from numpy.linalg import norm
import numpy.linalg as nla


A = np.array([[1, 10, -2], [10, 100, -6], [-2, -6, 10]])
X = np.ones(shape=(3, 3))
Y, R = nla.qr(X)
print(Y)
print(R)
print("========ITER 0========")
print(f"X0:\n{X}\nY0:\n{Y}\nR0:\n{R}")
for i in range(1, 50):
    X = A @ Y
    Y, R = nla.qr(X)
    print(f"========ITER {i}========")
    print(f"X{i}:\n{X}\nY{i}:\n{Y}\nR{i}:\n{R}")
