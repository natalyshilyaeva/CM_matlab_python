import numpy as np

def Max_eigenvalue(matrix):
    matrix = np.asarray(matrix, dtype=float)
    y111 = np.array([[1],[1],[1]], dtype=float)
    y1 = np.array(y111)
    y2 = np.matmul(matrix, y111)
    matrix_tmp = np.array(matrix)
    lmbda1 = np.array([[0],[0],[0]], dtype=float)
    lmbda2 = y2/y1
    while np.abs(np.mean(lmbda2) - np.mean(lmbda1)) > 0.001:
        y1 = np.array(y2)
        matrix_tmp = np.matmul(matrix_tmp, matrix)
        y2 = np.matmul(matrix_tmp, y111)
        lmbda1 = np.array(lmbda2)
        lmbda2 = y2/y1
    return np.mean(lmbda2)

print(Max_eigenvalue([[2.0,1.0, -4.0],[-3.0,4.0,0.0],[-3.0, -1.0,8.0]]))
print(Max_eigenvalue([[1.0, -3.0, -2.0],[-1.0,4.0,4.0],[-2.0,3.0,6.0]]))
print(Max_eigenvalue([[-1.0,7.0,2.0], [9.0,8.0,1.0], [5.0,2.0,7.0]]))
print(Max_eigenvalue([[-10.0,1.0, -1.0],[-4.0, -8.0, -1.0], [-2.0, -5.0, -9.0]]))
