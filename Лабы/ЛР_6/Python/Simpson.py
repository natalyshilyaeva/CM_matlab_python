import math
from array import *
import numpy as np

def Simpson(f,interval: list, step):
    func = lambda x: f(x)
    start = interval[0]
    stop = interval[1]
    sum_odd = 0
    sum_even = 0
    j = 0
    y_0 = func(start)
    y_n = func(stop)
    start += step

    values = [y_0]#список всех значений функции

    for i in np.arange(start, stop, step):
        if j % 2 == 0:
            sum_odd += func(i)
        else:
            sum_even += func(i)
        values.append(func(i))
        j += 1
    values.append(y_n)
    return step*(y_n + y_0 + sum_odd * 4 + sum_even * 2)/3
    
print('Последовательно введите интервал и шаг: ')

a= lambda x: (math.sin(x)) ** 3 - (math.cos(x/2)) ** 2 + 2
#a = lambda x: - x ** 4 + 3 * x ** 3 + 4 * x - 5
#a = lambda x: (math.sin(x)) ** 3 - 3 * math.sin(x ** 2) +4 * math.sin(x) + 4 * x
#a = lambda x: math.log(10 * math.sin((3 * (x/5)) ** 2) + 1)

b= [int(input()) for i in range(2)]
c= float(input())

print(Simpson(a,b,c))
