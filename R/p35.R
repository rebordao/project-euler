# 35 | Circular Primes
# https://projecteuler.net/problem=35
# 
# The number, 197, is called a circular prime because all rotations of the
# digits: 197, 971, and 719, are themselves prime.
# 
# There are thirteen such primes below 100:
# 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.
# 
# How many circular primes are there below one million?

#### Get all primes below 1e6 ####

# Initialises an array to store the logical indices of the prime nrs
idxs <- !logical(1e6-1)
idxs[1] <- F # excludes 1

j <- 2L
while (j < sqrt(length(idxs))) { # we just need to check these cases
  idxs[seq(j*2, length(idxs), by = j)] = F # excludes all multiples of j
  primes <- as.numeric(which(idxs == T))
  j <- primes[primes > j][1] # updates j to the next prime
}

# We can filter out all primes that are even and != 2 and 5

idxs <- sapply(primes, function (prime) {
  !any(c(2, 4, 5, 6, 8) %in% unlist(strsplit(as.character(prime), "")))
})
primes_b <- c(2, 5, primes[idxs])

#### Now for each remaining prime check if it's circular ####

get_comb <- function(nr) {
  # Returns a vector with all cycled digits of nr.
  
  if (nr < 10) {
    return(nr)
  }

  combs <- c(as.character(nr))
  for (i in 2:length(unlist(strsplit(combs[1], '')))) {
    prev <- unlist(strsplit(combs[i-1], ''))
    combs <- c(combs, paste0(c(prev[2:length(prev)], prev[1]), collapse=""))
  }
  return(as.numeric(combs))
}

result <- sum(unlist(sapply(primes_b, function(prime) {
  combs <- get_comb(prime) 
  if (sum(combs %in% primes) == length(combs)) {
    return(TRUE)
  }
})))

print(result)
