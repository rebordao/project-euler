# 32 | Pandigital products
# https://projecteuler.net/problem=32
#
# We shall say that an n-digit number is pandigital if it makes use of all
# the digits 1 to n exactly once; for example, the 5-digit number, 15234,
# is 1 through 5 pandigital.
#
# The product 7254 is unusual, as the identity, 39 × 186 = 7254,
# containing multiplicand, multiplier, and product is 1 through 9 pandigital.
#
# Find the sum of all products whose multiplicand/multiplier/product 
# identity can be written as a 1 through 9 pandigital.
#
# HINT: Some products can be obtained in more than one way so be sure
# to only include it once in your sum.

# The following link has a very elegant python solution.
# http://blog.dreamshire.com/project-euler-32-solution/

# Another nice solution at:
# http://www.mathblog.dk/project-euler-32-pandigital-products/

is_pandigital <- function(nr) {
  nr <- sort(as.numeric(unlist(strsplit(nr, ''))))
  if (all(nr == 1:length(nr))) {
    return(TRUE)  
  }
  return(FALSE)
}

# Trimming the search space is important.
# To get that paste0(a, b, a*b) is 9 digits, means that a and b are < 9999

prods <- unlist(sapply(1:9999, function(a) {
  for (b in 1:9999) {
    nr <- paste0(a, b, a*b)
    if (length(unlist(strsplit(nr, ''))) > 9) {
      break  
    }
    if (is_pandigital(nr) & length(unlist(strsplit(nr, ''))) == 9) {
      return(a*b)
    }
  }
}))

print(sum(unique(prods)))
