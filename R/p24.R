# 24 | Lexicographic permutations
# https://projecteuler.net/problem=24
# 
# A permutation is an ordered arrangement of objects. 
# For example, 3124 is one possible permutation of the digits 
# 1, 2, 3 and 4. If all of the permutations are listed numerically 
# or alphabetically, we call it lexicographic order. 
# The lexicographic permutations of 0, 1 and 2 are:
# 012   021   102   120   201   210
# 
# What is the millionth lexicographic permutation of the digits 
# 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

# Two solutions: a combinatorics-based approach and one based on brute-force

#### Combinatorics-based
# Check http://bit.ly/1xEOC0N for an explanation of the reasoning

nrs <- c()
cands <- 0:9
upper_bound <- 1e6
for (i in 9:0) {
  idx <- max(which(factorial(i) * 0:i < upper_bound)) # Gets the slot idx
  nrs <- c(nrs, cands[idx]) # Gets the nr that corresponds to the slot
  upper_bound <- upper_bound - (idx - 1) * factorial(i) # Updates upper_bound
  cands <- cands[!(cands %in% nrs)] # Removes the nr found from the candidates
}

# Prints the output
print(paste(nrs, collapse = ""))

#### Brute-force approach

# TODO
