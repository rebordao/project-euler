# Problem 52 | Permuted multiples
#
# https://projecteuler.net/problem=52
#
# It can be seen that the number, 125874, and its double, 251748, contain
# exactly the same digits, but in a different order.Find the smallest
# positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same
# digits.
#

get_multiples <- function(nr) {
  1:6 * nr
}

get_sorted_nr <- function(nr) {
  paste0(sort(unlist(strsplit(as.character(nr), ''))), collapse = '')
}

# TODO: do the permutatons without using the package gtools
library(gtools)
nr_digits <- 6
perms <- apply(permutations(10, nr_digits, 0:9, set = F), 1, function(i) {
  as.integer(paste0(i, collapse = ''))})

# Try with 6 digits numbers, then with 7, 8 and 9
for (i in perms) {
  if (length(unique(
    sapply(sapply(i, get_multiples), get_sorted_nr))) == 1) {
    print(i)
    break
  }  
}

