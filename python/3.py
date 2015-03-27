import math

limit = 600851475143
max_factor = int(math.floor(math.sqrt(limit)))


def is_prime(n):
    if n < 2:
        return False
    elif n == 2:
        return True
    else:
        for i in range(2, int(n / 2) + 1, 1):
            if n % i == 0:
                return False

    return True

factors = []
for n in range(2, max_factor):
    if limit % n == 0:
        factors.append(n)
        factors.append(limit / n)

factors = sorted(factors, key=lambda x: -x)


def largest_prime_factor(factors):
    for factor in factors:
        if is_prime(factor):
            return factor
    else:
        raise Exception("Not found!")

result = largest_prime_factor(factors)
print(result)
