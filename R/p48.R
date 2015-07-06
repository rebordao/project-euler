# 48 | Self powers
# https://projecteuler.net/problem=48
#
# The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
# 
# Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.

library(gmp)

res <- 0
for (nr in 1:1000) {
  res <- res + pow.bigz(nr, nr)
}
res_str <- unlist(strsplit(as.character(res), ""))
print(paste0(res_str[(length(res_str)-9):length(res_str)], collapse=""))