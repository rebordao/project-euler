# 50 | Consecutive prime sum
# https://projecteuler.net/problem=50
#
# The prime 41, can be written as the sum of six consecutive primes:
# 
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a
# prime below one-hundred.
# 
# The longest sum of consecutive primes below one-thousand that
# adds to a prime, contains 21 terms, and is equal to 953.
# 
# Which prime, below one-million, can be written as the sum of 
# the most consecutive primes?

cap <- 1e6-1

is_prime <- function(nr) {
  if (nr == 2) {
    return(T)
  }
  if (!any(nr %% 2:ceiling(sqrt(nr)) == 0)) {
    return(T)
  }
  return(F)
}

get_primes <- function(nr) {
  nrs <- seq(2, nr-1)
  return(nrs[sapply(nrs, is_prime)])
}

# Gets primes till cap
primes <- get_primes(cap)

chain <- c()
for (start in 1:10) { # instead 10 it should be length(primes) but that is slow
  seq <- primes[start:length(primes)]
  i <- 0
  total <- 0
  for (prime in seq) {
    total <- total + prime
    if (total > cap) {
      break
    }
    i <- i + 1
    if (any(total %in% primes)) {
      if (i > length(chain)) {
        chain <- seq[1:i]
      }
    }
  }
}
print(sum(chain))
print(length(chain))
