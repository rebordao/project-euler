# 47 | Distinct primes factors
# https://projecteuler.net/problem=47
#
# The first two consecutive numbers to have two distinct prime factors are:
# 
# 14 = 2 × 7
# 15 = 3 × 5
# 
# The first three consecutive numbers to have three distinct prime factors are:
# 
# 644 = 2 × 7 × 23
# 645 = 3 × 5 × 43
# 646 = 2 × 17 × 19.
# 
# Find the first four consecutive integers to have four distinct prime factors.
# What is the first of these numbers?

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
  nrs <- 2:(nr-1)
  primes <- nrs[sapply(nrs, is_prime)]
  prime_facts <- primes[nr %% primes == 0]
  return(prime_facts)
}

# TODO: make my solution faster, the one below is much faster but it's not mine
ct <- 2 * 3 * 5 * 7
prime_facts <- c(210, 330, 390)
while(T) {
  if (ct %% 1000 == 0) {print(ct)}
  if (length(get_primes(ct)) == 4) {
    prime_facts <- c(prime_facts, ct)
    if (all(prime_facts[length(prime_facts)-3:length(prime_facts)] + c(
      3, 2, 1, 0) == c(ct, ct, ct, ct))) {
      break
    }
  }
  ct <- ct + 1
}

ct
get_primes(ct)
get_primes(ct+1)
get_primes(ct+2)
get_primes(ct+3)

# getFactor <- function(n) {
#   f <- c()
#   for ( i in 2:ceiling(sqrt(n/2)))  {
#     if (n %%i ==0) {
#       n <- n/i
#       while(n %% i ==0) {
#         n <- n/i
#       }
#       f <- c(f,i)
#       if (gmp::isprime(n) !=0) {
#         f <- c(f,n)
#       }
#     }
#   }
#   return(unique(f))
# }
# 
# i <- 4
# n <- 10^(i-1)
# 
# while(TRUE) {
#   flag <- 0
#   for (j in 0:(i-1)) {
#     f <- getFactor(n+j)
#     if(length(f) != i)
#       break
#     if(any(gmp::isprime(f) == 0))
#       break
#     if (j==i-1)
#       flag <- 1
#   }
#   if (j == i-1 && flag==1) {
#     print(n)
#     break
#   }
#   n <- n+j+1
# }