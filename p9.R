# 9 | Special Pythagorean triplet
# https://projecteuler.net/problem=9
# 
# A Pythagorean triplet is a set of three natural numbers, a < b < c, 
# for which a ^ 2 + b ^ 2 = c ^ 2
# For example, 3 ^ 2 + 4 ^ 2 = 9 + 16 = 25 = 5 ^ 2.
# 
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

for (a in 1:998) {
  for (b in (a+1):998) {
    
    # Reduces the input space for the grid search
    if (a + b > 680) {
      break
    }
      
    # Computes c and checks if a + b + c = 1000
    c <- sqrt(a ^ 2 + b ^ 2)
    if (sum(a, b, c) == 1000L) {
      out <- c(a, b, c)
      break
    }
  }
}
print(prod(out))
