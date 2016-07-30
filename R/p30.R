# 30 | Digit fifth powers
# https://projecteuler.net/problem=30
#
# Surprisingly there are only three numbers that can be written
# as the sum of fourth powers of their digits:
#
# 1634 = 1^4 + 6^4 + 3^4 + 4^4
# 8208 = 8^4 + 2^4 + 0^4 + 8^4
# 9474 = 9^4 + 4^4 + 7^4 + 4^4
# As 1 = 14 is not a sum it is not included.
#
# The sum of these numbers is 1634 + 8208 + 9474 = 19316.
#
# Find the sum of all the numbers that can be written as the
# sum of fifth powers of their digits.
# -------------------------------------------

# MY STRATEGY

# We can't do brute force for all numbers. Thus we need to find an upper bound.
# Each digit of a number can be between 0 and 9.
# A 5 digit number has its maximum sum of 5th powers as 5 * 9 ^ 5 = 295245 and
# all 5 digit numbers are capped by this upper bound.
# Let's now check for 6 digits. 6 * 9 ^ 5 = 354294. Still fine.
# Let's now check for 7 digits. 7 * 9 ^ 5 = 413343 but this is a 6 digit
# number and thus our solution can't have more than 6 digits.

upper_bound <- 6 * 9 ^ 5

split_nr <- function(cand) {
    as.numeric(unlist(strsplit(as.character(cand), "")))
}

cands <- 2:upper_bound
print(sum(unlist(sapply(cands, function(cand) {
    if (sum(split_nr(cand) ^ 5) == cand) {
        return(cand)
    }
}))))
