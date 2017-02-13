# -*- coding: utf-8 -*-

from common import Calculator

limit = 1000
calc = Calculator(limit)

"""
Any reduced form fraction a/b with (10, b) = 1 can be written as a fraction
with denominator 10d − 1 for some d ≥ 1. Moreover, the period length of the decimal
expansion for a/b is the smallest d ≥ 1 such that 10d ≡ 1 mod b. In particular, d ≤ ϕ(b)
and the period length is independent of the numerator a.
"""
for d in reversed(calc.primes):
    period = 1

    while pow(10, period, d) != 1:
        period += 1
    # print(d-1, period)
    if d-1 == period:
        break

print(d)
