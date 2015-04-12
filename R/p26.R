# 26 | Reciprocal cycles
# https://projecteuler.net/problem=26
#
# A unit fraction contains 1 in the numerator. The decimal representation
# of the unit fractions with denominators 2 to 10 are given:
#
# 1/2  = 	0.5
# 1/3	= 	0.(3)
# 1/4	= 	0.25
# 1/5	= 	0.2
# 1/6	= 	0.1(6)
# 1/7	= 	0.(142857)
# 1/8	= 	0.125
# 1/9	= 	0.(1)
# 1/10	= 	0.1
# Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. 
# It can be seen that 1/7 has a 6-digit recurring cycle.
# 
# Find the value of d < 1000 for which 1/d contains the 
# longest recurring cycle in its decimal fraction part.

# First write down some unit fractions
data.frame(dec_rep = 1 / 1:20)

# You can see that there are three types of rational numbers:
# 1) finite expansion for 2, 4, 5, 8, 10, 16, 20, ...
# 2) infinite periodic from the beginning, for 3, 7, 9, 11, 13, 17, 19, ...
# 3) infinite irrational after some initial numbers, for 6, 12, 14, 15, 18, ...

# The page http://mathworld.wolfram.com/DecimalExpansion.html
# has many useful results about decimal expansion. Something that
# stands out is "The number of digits in the repeating portion
# of the decimal expansion of a rational number can also be found
# directly from the multiplicative order of its denominator."

library(gmp)

get_multi_ord <- function(nr, base = 10L) {
  # Computes Multiplicative Orders
  return (which(mod.bigz(pow.bigz(base, 1:nr), nr) == 1L)[1])
}

# gets d with the longest recurring cycle
print (which.max(sapply(1:999, get_multi_ord)))
