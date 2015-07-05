# 46 | Goldbach's other conjecture
# https://projecteuler.net/problem=46
# 
# It was proposed by Christian Goldbach that every odd composite number 
# can be written as the sum of a prime and twice a square.
# 
# 9  =  7 + 2 × 1^2
# 15 =  7 + 2 × 2^2
# 21 =  3 + 2 × 3^2
# 25 =  7 + 2 × 3^2
# 27 = 19 + 2 × 2^2
# 33 = 31 + 2 × 1^2
# 
# It turns out that the conjecture was false.
# 
# What is the smallest odd composite that cannot be written as the
# sum of a prime and twice a square?

# Is odd
# Is a composite, thus it's not prime

is_prime <- function(nr) {
  if (nr == 2) {
    return(T)
  }
  if (any(nr %% 2:ceiling(sqrt(nr)) == 0)) {
    return(F)
  }
  return(T)
}

stop <- F
cand <- 7
while (!stop) {
  cand <- cand + 2
  if (!is_prime(cand)) {
    primes_cands <- 2:(cand-1)
    primes_cands <- c(2, primes_cands[primes_cands %% 2 != 0])
    primes <- primes_cands[sapply(primes_cands, is_prime)]
    if (sum(sqrt((cand - primes) / 2) == floor(sqrt((cand - primes) / 2))) == 0) {
      stop <- T
    }
  }
}

print(cand)