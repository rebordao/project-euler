from collections import defaultdict


class Calculator(object):
    def __init__(self, n, make_primes=True):
        if make_primes:
            self.primes = self.primes_to_n(n)
        else:
            self.primes = []

    def primes_to_n(self, n):
        sieve = [True] * n

        for i in range(3, int(n**0.5) + 1, 2):
            if sieve[i]:
                sieve[i*i::2*i] = [False] * ((n-i*i-1)/(2*i)+1)

        primes = [2]

        for i in range(3, n, 2):
            if sieve[i]:
                primes.append(i)

        return primes

    def factorise_dict(self, n):
        '''
        f(120) -> {2: 3, 3:1, 5:1} -> 2^3 * 3^1 * 5*1 -> 120
        '''
        res = defaultdict(lambda: 0)
        for prime in self.primes:
            while n % prime == 0:
                n = n // prime
                res[prime] += 1
            if n == 1:
                return dict(res)
        return dict(res)

    def factorise_flat(self, n):
        result = self.factorise_dict(n)
        flat_result = []

        for key in result:
            flat_result.append((key, result[key]))

        return flat_result

    def sum_of_factors(self, n):
        result = self.factorise_dict(n)
        product = 1

        for prime, power in result.items():
            product *= (prime ** (power + 1) - 1) / (prime - 1)
        return product

    def abundant_numbers(self, start=12, end=28123):
        result = []
        for i in range(start, end+1):
            if (self.sum_of_factors(i) - i) > i:
                result.append(i)
        return result
