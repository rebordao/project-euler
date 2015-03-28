# 5 | Smallest multiple
# 
# https://projecteuler.net/problem=5
# 
# 2520 is the smallest number that can be divided by each of the numbers from 
# 1 to 10 without any remainder. What is the smallest positive number that is 
# evenly divisible by all of the numbers from 1 to 20?

# Tweaked brute-force solution, only takes 32 seconds in my 6 years-old laptop

nr <- 20
while (sum(nr %% 11:20) > 0L) {
  # if it's divisible by 14, 15, 16, 18 and 20, it's also by {1, 2, ..., 10}
  nr <- nr + 20L # checks only for multiples of 20
}
print(nr)