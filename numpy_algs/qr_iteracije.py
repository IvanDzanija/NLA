import numpy as np
from numpy.linalg import norm
import numpy.linalg as nla


A = np.array([[1, 10, -2], [10, 100, -6], [-2, -6, 10]])
for i in range(1, 50):
    Q, R = nla.qr(A)
    A = R @ Q
    print(f"========ITER {i}========")
    print(f"A{i}:\n{A}")
    print(f"Q{i}:\n{Q}")
