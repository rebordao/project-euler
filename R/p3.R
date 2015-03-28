# 3 | Largest prime factor
# 
# https://projecteuler.net/problem=3
# 
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?

# Gets factors of evil_nr
evil_nr <- 600851475143L
cap <- floor(sqrt(evil_nr))

nrs <- 2:cap # testing just for these cases makes it faster
idxs <- which(evil_nr %% nrs == 0L) # gets indices of the factors
factors <- c(nrs[idxs], evil_nr / nrs[idxs])

get_primes <- function(factor) {
  "
  Decomposes factor in its prime factorization
  "
  
  # case for 2, then we just need to iterate for 3 + 2i, i = 1, 2, ...
  primes <- c()  
  if (factor %% 2L == 0L) {
    primes <- c(2L)
  }
  
  i <- 3L
  while (factor > 1L) {
    while (factor %% i == 0L) {
      primes <- c(primes, i)
      factor <- factor / i
    }
    i <- i + 2L
  }
  return(primes)
}

max(unique(unlist(sapply(factors, get_primes))))
