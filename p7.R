# 7 | 10001st prime
# https://projecteuler.net/problem=7
# 
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see 
# that the 6th prime is 13.
# 
# What is the 10001st prime number?

nr <- 1L # checks all 1 + 2 * i because all primes, excepting 2, are odd nrs
ct <- 1L # starts at 1 because the nr 2 is a prime
while (ct < 10001L) {
  nr <- nr + 2L
  if (!any(nr %% 2:ceiling(sqrt(nr)) == 0L)) { # check if nr is prime
    ct <- ct + 1L
  }
}
print(nr)
