# 40 | Champernowne's constant
# https://projecteuler.net/problem=40
# 
# An irrational decimal fraction is created by
# concatenating the positive integers:
#   
# 0.123456789101112131415161718192021...
# 
# It can be seen that the 12th digit of the fractional part is 1.
# 
# If dn represents the nth digit of the fractional part,
# find the value of the following expression.
# 
# d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000

idxs <- c(1, 1e1, 1e2, 1e3, 1e4, 1e5, 1e6)
nrs_str <- paste0(unlist(sapply(1:1e6, as.character)), collapse="")
print(prod(as.numeric(unlist(strsplit(nrs_str, ""))[idxs])))

# TODO: check the solution discussed in 
# http://www.mathblog.dk/project-euler-40-digit-fractional-part-irrational-number/