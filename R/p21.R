# 21 | Amicable numbers
<<<<<<< HEAD
=======
# 
>>>>>>> aa005b7... Added support to linebreaks if files are executed via command line.
# https://projecteuler.net/problem=21
# 
# Let d(n) be defined as the sum of proper divisors of n 
# (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a != b, then a and b are 
# an amicable pair and each of a and b are called amicable numbers.
# 
# For example, the proper divisors of 220 are 
# 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284. 
# The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
# 
# Evaluate the sum of all the amicable numbers under 10000.

print(sum(
  unlist(sapply(2:9999, function(nr) {
  nrs <- 1:(nr-1)
  b <- sum(nrs[which(nr %% nrs == 0)])
  nrs <- 1:(b-1)
  if (b > 1) { # perhaps this step can be made redundant
    a <- sum(nrs[which(b %% nrs == 0)])
    if (a == nr & a != b) {
      return(nr)
    }
  }
}))))
