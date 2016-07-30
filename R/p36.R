# 36 | Double-base palindromes
# https://projecteuler.net/problem=36
# 
# The decimal number, 585 = 1001001001 (base 2, binary number),
# is palindromic in both bases.
# 
# Find the sum of all numbers, less than one million,
# which are palindromic in base 10 and base 2.
# 
# (Please note that the palindromic number, in either base, may not
# include leading zeros.)

upper_bound <- 1e6 - 1

int_to_bin <- function(int) {
  # Transforms an integer into its binary representation.
  aux <- rev(as.integer(intToBits(int)))
  start <- which(aux == 1)[1]
  return(paste0(aux[start:length(aux)], collapse=""))
}

is_palindromic <- function(nr) {
  # Checks if nr is a palindromic number.
  
  if (class(nr) == 'integer') {
    nr <- as.character(nr)
  }

  nr_str <- unlist(strsplit(nr, ""))
  if (all(nr_str == nr_str[length(nr_str):1])) {
    return(TRUE)
  }
  return(FALSE)
}

# Gets palindrome numbers in base 10
pals <- seq(1, upper_bound)[sapply(1:upper_bound, is_palindromic)]

# Cannot include leading zeros, it means that the palindromes need to be odd
pals <- pals[pals %% 2 == 1]

print(sum(pals[unlist(sapply(pals, function(nr) {
  is_palindromic(int_to_bin(nr))
}))]))
