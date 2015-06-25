# 37 | Truncatable primes
# https://projecteuler.net/problem=37
# 
# The number 3797 has an interesting property. Being prime itself,
# it is possible to continuously remove digits from left to right,
# and remain prime at each stage: 3797, 797, 97, and 7. Similarly
# we can work from right to left: 3797, 379, 37, and 3.
# 
# Find the sum of the only eleven primes that are both truncatable
# from left to right and right to left.
# 
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.

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

can_be_truncatable <- function(nr) {
  if (!any(unlist(strsplit(as.character(nr), "")) %in% c(0, 4, 6, 8))) {
    return(T)
  }
  return(F)
}

truncs <- function(nr) {
  str_nr <- unlist(strsplit(as.character(nr), ""))
  nrs <- c()
  for (i in 1:length(str_nr)) {
    nrs <- c(nrs, paste0(str_nr[i:length(str_nr)], collapse=""))
  }
  
  for (i in (length(str_nr)-1):1) {
    nrs <- c(nrs, paste0(str_nr[1:i], collapse=""))
  }
  
  return(as.numeric(nrs))
}

# Removes 2, 3, 5 and 7
cands <- primes[5:length(primes)]

# The numbers need to be odd
cands <- cands[unlist(sapply(cands, can_be_truncatable))]

# Gets truncatable numbers
idxs <- sapply(cands, function(cand) {
  if (all(truncs(cand) %in% primes)) {
    return(T)
  }
  return(F)
})

print(sum(cands[idxs]))