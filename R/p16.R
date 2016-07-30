# 16 | Power digit sum
# https://projecteuler.net/problem=16
# 
# 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
# 
# What is the sum of the digits of the number 2^1000?

# Writes nr as a string
nr <- sprintf("%f", 2^1000)

# Splits nr
nr_splitted <- unlist(strsplit(nr, "", ""))

# Removes "."
nr_splitted <- subset(
  nr_splitted, !(1:length(nr_splitted) %in% which(nr_splitted == ".")))

# Computes sum
print(sum(as.numeric(nr_splitted)))
