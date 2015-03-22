#### 7 | 10001st prime
"
https://projecteuler.net/problem=7

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see 
that the 6th prime is 13.

What is the 10001st prime number?
"

#### Tweaked brute-force solution but slower than the other solution below

nr <- 3L # starts here, only checks 3 + 2 * i because the evens are not primes
ct <- 1L # starts at 1 because the nr 2 is a prime
while (ct < 10001L) {
  if (!any(nr %% 2:(nr-1) == 0L)) { # checks if nr is prime
    ct <- ct + 1L
  }
  nr <- nr + 2L # because it only needs to check half of the iterations
}
nr - 2L # we don't need to store the primes, we just need the last one

#### Faster solution

# Initialises an array to store the indices of the prime nrs
idxs <- !logical(1e6) # starts with a large number
idxs[1] <- F # excludes 1

j <- 2L
while (j < sqrt(length(idxs))) { # we just need to check these cases
  idxs[seq(j*2, length(idxs), by = j)] = F # excludes all multiples of j
  primes <- as.numeric(which(idxs == T))
  j <- primes[primes > j][1] # updates j to the next prime
}
primes[10001]