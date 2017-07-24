# 85 | Counting rectangles
# https://projecteuler.net/problem=85
#
# By counting carefully it can be seen that a rectangular grid measuring 3
# by 2 contains eighteen rectangles. Although there exists no rectangular
# grid that contains exactly two million rectangles, find the area of the
# grid with the nearest solution.
#

# This is a combinatorics problem
# The number of rectangles can be seen as a projection in the x and y axis. 
# Interpret the problem as a combination of horizontal and vertical lines 
# for example, in a rectangle 2x3 there are 3 horizontal lines and 4 vertical.
# Now compute how many different combinations of 2 are in 3, how many of 2 are in 4. Multiply
# both and get the result.

target <- 2e6
min_dist <- 2e6

get_nr_combinations <- function(x) {
  (x^2 + x) / 2 
}

for (i in 1999:1) {
  for (j in 1:2000) {
    nr_rectangles <- get_nr_combinations(i) * get_nr_combinations(j)
    dist <- abs(target - nr_rectangles)
    if (dist < min_dist) {
      min_dist <- dist
      area <- i * j
    }
  }
}
print(area)