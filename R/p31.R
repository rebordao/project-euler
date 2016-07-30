# 31 | Coin Sums
# https://projecteuler.net/problem=31
#
# In England the currency is made up of pound and pence and there
# are eight coins in general circulation:
# 
# 1p, 2p, 5p, 10p, 20p, 50p, 1£ (100p) and 2£ (200pe).
# It is possible to make 2 in the following way:
# 
# 1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
# How many different ways can £2 be made using any number of coins?
# 
# Before solving this problem check the following materials:
# http://users.softlab.ntua.gr/~ttsiod/euler31.html
# http://blog.dreamshire.com/project-euler-31-solution/
# http://blog.dreamshire.com/project/dyn_prog.pdf

# Basically we want to get the number of non-negative solutions for
# 200*x200 + 100*x100 + 50*x50 + 20*x20 + 10*x10 + 5*x5 + 2*x2 + 1*x1 = 200

# This problem could be solved with Brute Force or a Recursive Function 
# but Dynamic Programming is faster.

#### Dynamic Programming Solution ####

coins <- c(1, 2, 5, 10, 20, 50, 100, 200)
target <- 200

X <- data.frame(matrix(1, nrow=target, ncol=length(coins)))

for (row in 1:nrow(X)) {
  for (col in 2:ncol(X)) {
      if (row > coins[col]) {
        # Deals with the cases row - coins[col] > 0
        X[row, col] <- X[row, col-1] + X[row - coins[col], col]
      } else if (row == coins[col]) {
        # Special case
        X[row, col] <- X[row, col-1] + 1
      } else {
        # Impossible cases
        X[row, col] <- X[row, col-1]
      }
  }   
}

print(X[nrow(X), ncol(X)])
