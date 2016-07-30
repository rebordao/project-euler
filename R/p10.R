# 10 | Summation of primes
# https://projecteuler.net/problem=10
# 
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# 
# Find the sum of all the primes below two million.

is_prime <- function(nr) {
  if (!any(nr %% 2:ceiling(sqrt(nr)) == 0)) {
    return(T)
  }
  return(F)
}

cands <- 3:(2e6-1)
print(sum(c(2, cands[which(sapply(cands, is_prime))])))
