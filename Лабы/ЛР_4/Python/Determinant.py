import numpy as np


def Determinant(matrix):
    matrix = np.asarray(matrix, dtype=float)
    if matrix.shape[0] * matrix.shape[1] == 1:
        return matrix[0,0]
    
    if matrix.shape[0] == matrix.shape[1]:
        if matrix[0,0] != 0:
            a11 = matrix[0,0]
            matrix[:,0] = matrix[:,0]/matrix[0,0]
            for column_index in range(1, matrix.shape[1]):
                matrix[:,column_index] += matrix[:,0]*(-matrix[0,column_index])
            return a11*Determinant(matrix[1:,1:]) 
        else:
             k = 0
             while (matrix[0,k] == 0) and (k+1<=matrix.shape[1]-1):
                 k+=1
             if matrix[0,k] != 0:
                 matrix[:,0], matrix[:,k] = np.array(matrix[:,k]),\
                 np.array(matrix[:,0])
                 a11 = matrix[0,0]
                 matrix[:,0] = matrix[:,0]/matrix[0,0]
                 for column_index in range(1, matrix.shape[1]):
                     matrix[:,column_index] +=(
                     matrix[:,0]*(-matrix[0,column_index]))
                 return (-a11)*Determinant(matrix[1:,1:])  
        
        
    else:
        return
    

print(Determinant([[1,6, -4], [-8,6,7], [-7,0,8]]))
print(Determinant([[-4.6, -1.71, -3.06],[2.66, -3.52,0.22],[-0.79, -1.9, -4.04]]))
print(Determinant([[1,0,0],[0,1,0], [0,0,1]]))
print(Determinant([[1,2,3], [4,5,6], [7,8,9]]))
