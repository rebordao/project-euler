import math

# http://en.wikipedia.org/wiki/Sieve_of_Atkin


def get_primes(limit=2e6):
    limit = int(limit)
    root = int(math.ceil(math.sqrt(limit)))
    primes = [2, 3]
    sieve = [False] * (limit + 1)

    for z in range(0, limit):
        sieve[z] = False

    for x in range(1, root + 1):
        for y in range(1, root + 1):
            n = (4 * x * x) + (y * y)

            if n <= limit and n % 12 in (1, 5):
                sieve[n] = not sieve[n]

            n = (3 * x * x) + (y * y)
            if n <= limit and n % 12 == 7:
                sieve[n] = not sieve[n]

            n = (3 * x * x) - (y * y)
            if (x > y and n <= limit and n % 12 == 11):
                sieve[n] = not sieve[n]

    for n in range(5, root):
        if sieve[n]:
            for k in range(n**2, limit + 1, n**2):
                sieve[k] = False

    for count, i in enumerate(sieve):
        if i:
            primes.append(count)

    return primes

primes = get_primes()
print(sum(primes))
