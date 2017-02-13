# 23 | Non-abundant sums
<<<<<<< HEAD
=======
# 
>>>>>>> aa005b7... Added support to linebreaks if files are executed via command line.
# https://projecteuler.net/problem=23
# 
# A perfect number is a number for which the sum of its 
# proper divisors is exactly equal to the number. For example, 
# the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, 
# which means that 28 is a perfect number.
# 
# A number n is called deficient if the sum of its proper divisors 
# is less than n and it is called abundant if this sum exceeds n.
# 
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, 
# the smallest number that can be written as the sum of two 
# abundant numbers is 24. By mathematical analysis, it can be 
# shown that all integers greater than 28123 can be written as 
# the sum of two abundant numbers. However, this upper limit 
# cannot be reduced any further by analysis even though it is 
# known that the greatest number that cannot be expressed as 
# the sum of two abundant numbers is less than this limit.
# 
# Find the sum of all the positive integers which cannot be 
# written as the sum of two abundant numbers.

cap <- 28123
nrs <- 1:cap # 1, 2, and 3 aren't abundant and would mess with get_sum_divisors

get_sum_divisors <- function(nr) {
  "
  Gets sum of the divisors of nr.
  "
  cands <- 2:floor(sqrt(nr))
  divs <- cands[nr %% cands == 0]
  divs <- divs[divs != 1 & divs != nr]
  return(sum(unique(c(1, divs, nr / divs))))
}

# Finds all abundant nrs
abundants <- nrs[sapply(nrs, get_sum_divisors) > nrs]

# Finds the summations of all abundant nrs and removes the ones > cap
sums <- matrix(0, nrow = length(abundants), ncol = length(abundants))
for (row in 1:length(abundants)) {
  aux <- abundants[row] + abundants
  idxs <- aux <= cap
  sums[row, idxs] <- aux[idxs]
}

# Computes the summation of the nrs that are not the sum of 2 abundant nrs
print(sum(1:cap) - sum(unique(c(sums))))
