'''
Also read:
http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
Probably better than bforce?
'''


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

current = 3
count = 1
while True:
    if is_prime(current):
        count += 1

    if count == 10001:
        break

    current += 1


print(current)
