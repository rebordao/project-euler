# 3 | Largest prime factor
<<<<<<< HEAD
=======
# 
>>>>>>> aa005b7... Added support to linebreaks if files are executed via command line.
# https://projecteuler.net/problem=3
# 
# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?
<<<<<<< HEAD

is_prime <- function(nr) {
  if (nr == 2L) {
    return(T)
  }
  if (!any(nr %% 3:ceiling(sqrt(nr)) == 0L)) {
    return(T)
  }
  return(F)
}
=======
>>>>>>> aa005b7... Added support to linebreaks if files are executed via command line.

# Get factors of evil_nr
evil_nr <- 600851475143L
cap <- ceiling(sqrt(evil_nr))
nrs <- 2:cap # testing just for these cases makes it faster
idxs <- which(evil_nr %% nrs == 0L) # gets indices of the factors
factors <- c(nrs[idxs], evil_nr / nrs[idxs])

# Print max of factors
print(max(factors[sapply(factors, is_prime)]))
