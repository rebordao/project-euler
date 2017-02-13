# 14 | Longest Collatz sequence
<<<<<<< HEAD
=======
# 
>>>>>>> aa005b7... Added support to linebreaks if files are executed via command line.
# https://projecteuler.net/problem=14
# 
# The following iterative sequence is defined for the set of positive integers:
#   
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
# 
# Using the rule above and starting with 13, we generate the following sequence:
#   
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) 
# contains 10 terms. Although it has not been proved yet (Collatz Problem), 
# it is thought that all starting numbers finish at 1.
# 
# Which starting number, under one million, produces the longest chain?
# 
# NOTE: Once the chain starts the terms are allowed to go above one million.

comp_collatz_iters <- function(vect) {
  "
  Computes the nr of iterations for a collatz chain to converge.
  It does it in vectorized form. 
  "
  
  # Initialises the nr_iters for each element in vect
  nr_iters <- rep(1, length(vect))
  
  while (mean(vect) > 1L) {
    
    # Updates counter
    nr_iters <- nr_iters + ifelse(vect == 1L, 0L, 1L)
    
    # Vectorises the application of the collatz rule
    vect <- ifelse(
      vect == 1L, vect, ifelse(vect %% 2L == 0L, vect / 2L, vect * 3L + 1L))
  }
  return(nr_iters)
}

# Computes result
cap <- 1e6 - 1
nrs <- 1:cap
print(which.max(comp_collatz_iters(nrs)))
