# 28 | Number spiral diagonals
#
# https://projecteuler.net/problem=28
#
# Starting with the number 1 and moving to the right in a
# clockwise direction a 5 by 5 spiral is formed as follows:
#
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13
#
# It can be verified that the sum of the numbers on the diagonals is 101.
#
# What is the sum of the numbers on the diagonals in a 1001 by 1001 
# spiral formed in the same way?

# Looking at the matrix we can see that the upper part of the diagonals are:
# (2i + 1)^2 - 2i (for going up left)
# (2i + 1)^2 (for going up right)

# Thus their sum is of the form 2 * (2i + 1)^2 - 2i = 8i^2 + 6i + 4

# By observation we can see that the lower part of the diagonals are:
# (2i - 1)^2 + 2i (for going down left)
# (2i)^2 + 1 (for going down right)

# Thus the intended sum is:
# 8i^2 + 6i + 4 + (2i - 1)^2 + 2i + 2i^2 + 1 =
# 8i^2 + 8i + 5 + (2i - 1)^2 + (2i)^2 =
# 16i^2 + 4i + 4

# Computed the values for the 1000 rows, their sum and added 1
print(sum(4 * sapply(1:500, function(i) {
    4 * i^2 + i + 1
})) + 1)

# Not necessary for the solution but interesting readings:

# Some theoretical results behind such type of grids
# - http://en.wikipedia.org/wiki/Ulam_spiral

# A similar reasoning, although different in its solution
# - http://www.mathblog.dk/project-euler-28-sum-diagonals-spiral/
