#### 10 | Summation of primes
"
https://projecteuler.net/problem=10

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
"

# Initialises an array to store the logical indices of the prime nrs
idxs <- !logical(2e6)
idxs[1] <- F # excludes 1

j <- 2L
while (j < sqrt(length(idxs))) { # we just need to check these cases
  idxs[seq(j*2, length(idxs), by = j)] = F # excludes all multiples of j
  primes <- as.numeric(which(idxs == T))
  j <- primes[primes > j][1] # updates j to the next prime
}
sum(primes)