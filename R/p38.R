# 38 | Pandigital multiples
# https://projecteuler.net/problem=38
# 
# Take the number 192 and multiply it by each of 1, 2, and 3:
#   
# 192 × 1 = 192
# 192 × 2 = 384
# 192 × 3 = 576
# By concatenating each product we get the 1 to 9 pandigital,
# 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)
# 
# The same can be achieved by starting with 9 and multiplying
# by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, 
# which is the concatenated product of 9 and (1,2,3,4,5).
# 
# What is the largest 1 to 9 pandigital 9-digit number that 
# can be formed as the concatenated product of an integer with (1,2, ... , n) 
# where n > 1?

is_pandigital <- function(nr, n) {
  prod_conc <- unlist(strsplit(paste0(nr * 1:n, collapse=""), ""))
  if (all(1:9 %in% prod_conc) & length(prod_conc) == 9) {
    return(T)
  }
  return(F)
}

# The largest 1 to 9 pandigital 9-digit number needs to be in this range
# [123456789, 987654321]

# For the 1 digit integer 9 the pandigital is 918273645, thus
# integers below 1 9 cannot be a possibility because their concatenated 
# product is smaller than 918273645
# also the max pandigital needs to start with a 9

# 2 digit integers cannot work out because for n = 3, the pandigital
# length is 8 and for n = 4 its length is 11
99 * 1:3
99 * 1:4

# 3 digit integers don't work out for the same reasons

# as the max pandigital needs to start with a 9 then
# the integer needs to start with 9 as well and n = 2
cands <- 9000:9999

# Instead checking 999 numbers, it's possible to check just 253
# check the link below to see how
# http://www.mathblog.dk/project-euler-38-pandigital-multiplying-fixed-number/

idxs <- unlist(sapply(cands, function(cand) is_pandigital(cand, 2)))

print(paste0(cands[idxs][which.max(cands[idxs])] * 1:2, collapse=""))
