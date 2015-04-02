from functools import reduce
import math
from operator import mul


def find_numbers():
    for a in range(1, 1000):
        for b in range(a, 1000):
            if a + b > 680:
                break
            else:
                c = math.sqrt(a ** 2 + b ** 2)
                if sum((a, b, c)) == 1000:
                    return (a, b, int(c))

result = find_numbers()
product = reduce(mul, result)
print(product)
