# 4 | Largest palindrome product
# 
# https://projecteuler.net/problem=4
# 
# A palindromic number reads the same both ways. The largest 
# palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# 
# Find the largest palindrome made from the product of two 3-digit numbers.

nr1 <- 100:999
nr2 <- 100:999

# Computes all cases
prod <- sapply(nr1, function(n) {n * nr2})
prod[lower.tri(prod)] <- NA # removes the symetric cases

# Writes the matrix into an array of unique elements
all_elements <- unlist(lapply(1:ncol(prod), function(col) {prod[, col]}))
elements <- unique(subset(all_elements, !is.na(all_elements))) 

# Now we just have 24% of the cases to analyse

# Gets palindromes
palindromes <- sapply(elements, function(element) {
  
  # splits `element`
  x <- strsplit(as.character(element), split = "")[[1]]
  
  # Checks if `element` is a palindrome
  if (length(x) == 5) {
    if (all(x[1:2] == x[5:4])) {
      return(element)
    }
  }
  if (length(x) == 6) {
    if (all(x[1:3] == x[6:4])) {
      return(element)
    }
  }
})

max(unlist(palindromes))
