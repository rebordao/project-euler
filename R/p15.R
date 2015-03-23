#### 15 | Lattice paths
"
https://projecteuler.net/problem=15

Starting in the top left corner of a 2×2 grid, and only being 
able to move to the right and down, there are exactly 6 routes 
to the bottom right corner.

How many such routes are there through a 20×20 grid?

The article below is worth reading:
http://www.mozartreina.com/counting-lattice-paths.html

Although my approach is different, I fix the column 
and fill it by row attending to the previous column.
"

# Sets up the length of the grid
len_grid <- 20

# Stores the counts
counts <- data.frame(matrix(0, len_grid + 1, len_grid + 1))

# Initialises the 1st row and column
counts[1, ] <- 1
counts[, 1] <- 1

for (col in 2:ncol(counts)) {
  for (row in 2:nrow(counts)) {
    # Fills by row attending to the previous column
    counts[row, col] <- sum(counts[1:row, col - 1])
  }
}

# Prints the results
print(counts[len_grid + 1, len_grid + 1])