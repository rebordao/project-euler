# 27 | Quadratic primes
#
# https://projecteuler.net/problem=27
#
# Euler discovered the remarkable quadratic formula:
#
# n^2 + n + 41
#
# It turns out that the formula will produce 40 primes for the
# consecutive values n = 0 to 39. However, when n = 40,
# 40^2 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41,
# and certainly when n = 41, 41^2 + 41 + 41 is clearly divisible by 41.
#
# The incredible formula  n^2 − 79n + 1601 was discovered,
# which produces 80 primes for the consecutive values n = 0 to 79.
# The product of the coefficients, −79 and 1601, is −126479.
#
# Considering quadratics of the form:
# n^2 + an + b, where |a| < 1000 and |b| < 1000
#
# where |n| is the modulus/absolute value of n
# e.g. |11| = 11 and |−4| = 4
# Find the product of the coefficients, a and b, for the
# quadratic expression that produces the maximum number of
# primes for consecutive values of n, starting with n = 0.

library(gmp)

# Quadratic formula
quadr_form <- function(n, a, b) {
  return(n ^ 2 + a * n + b)
}

# As n^2 + an + b is a prime for n = 0, then b needs to be a prime
bs <- seq(2, 999)[sapply(cands, isprime) == 2]

# and n^2 + an + b > 0 because needs to be a prime, thus b > -(n^2 + an)

# and for n = 1, then 1 + a + b > 1 <=> a > -b

nr_max <- 0
for (b in bs) {
    for (a in seq((-b + 1), 999, 1)) {
        n = 0
        # Finds nr of consecutive primes
        while (isprime(quadr_form(n, a, b)) & b > -(n ^ 2 + a * n)) {
            n <- n + 1
        }
        # Stores the biggest nr of consecutive primes and a * b
        if (n > nr_max) {
            nr_max <- n
            ab <- a * b
        }
    }
}

print(nr_max)
print(ab)

# TODO vectorise the above loops
