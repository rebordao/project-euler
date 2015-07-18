# 1 | Multiples of 3 and 5
# https://projecteuler.net/problem=1
#
# If we list all the natural numbers below 10 that are multiples of 3 or 5,
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

# floor(999 / 3) = 333 thus
div_by_3 = 3 * [1:333]

# floor(999 / 5) = 199 thus
div_by_5 = 5 * [1:199]

# but some numbers are multiples of 3 and 5, and we're counting them twice
# floor(999 / 15) = 66 thus
div_by_15 = 15 * [1:66]

println(sum(div_by_3) + sum(div_by_5) - sum(div_by_15))
