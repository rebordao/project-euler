# 1 | Multiples of 3 and 5
# 
# https://projecteuler.net/problem=1
# 
# If we list all the natural numbers below 10 that are multiples of 3 or 5, 
# we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

nrs <- 3:999 # we just need to check for the ones between 3 and 999
idxs <- nrs %% 3 == 0 | nrs %% 5 == 0
sum(nrs[idxs])