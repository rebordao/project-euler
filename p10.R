# 10 | Summation of primes
# https://projecteuler.net/problem=10
# 
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
# 
# Find the sum of all the primes below two million.

cap <- 2e6-1

is_prime <- function(nr) {
  if (!any(nr %% 2:ceiling(sqrt(nr)) == 0)) {
    return(T)
  }
  return(F)
}

total <- 2
nr <- 1L
while (nr < cap) {
  nr <- nr + 2L
  if (is_prime(nr)) {
    total <- total + nr
  }
}
print(total)
