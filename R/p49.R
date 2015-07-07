# 49 | Prime permutations
# https://projecteuler.net/problem=49
#
# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms 
# increases by 3330, is unusual in two ways:
# (i) each of the three terms are prime, and, 
# (ii) each of the 4-digit numbers are permutations of one another.
# 
# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes,
# exhibiting this property, but there is one other 4-digit increasing sequence.
# 
# What 12-digit number do you form by concatenating the three 
# terms in this sequence?

is_prime <- function(nr) {
  if (nr == 2) {
    return(T)
  }
  if (!any(nr %% 2:ceiling(sqrt(nr)) == 0)) {
    return(T)
  }
  return(F)
}

start <- 1487
while (start + 2 * 3330 <= 9999) {
  if (is_prime(start) & is_prime(start + 3330) & is_prime(start + 2 * 3330)) {
    if (length(unique(c(
      unlist(strsplit(as.character(start), "")),
      unlist(strsplit(as.character(start + 3330), "")),
      unlist(strsplit(as.character(start + 2 * 3330), ""))))
      ) <= 4) {
      print(paste0(c(start, start + 3330, start + 2 * 3330), collapse=""))  
    }
  }
  start <- start + 2
}
