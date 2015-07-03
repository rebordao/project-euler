# 42 | Coded triangle numbers
# https://projecteuler.net/problem=42
# 
# The nth term of the sequence of triangle numbers is given by, 
# tn = ½n(n+1); so the first ten triangle numbers are:  
#  1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# By converting each letter in a word to a number corresponding to
# its alphabetical position and adding these values we form a word value.
# For example, the word value for SKY is 19 + 11 + 25 = 55 = t10.
# If the word value is a triangle number then we shall call the word
# a triangle word.
#
# Using words.txt (right click and 'Save Link/Target As...'), a 
# 16K text file containing nearly two-thousand common English words, 
# how many are triangle words?

dat_raw <- read.csv('data/p42_words.txt', header = F)
dat <- sapply(1:ncol(dat_raw), function(col) {
  return(tolower(as.character(dat_raw[, col])))
})

word_vals <- unlist(lapply(dat, function(word) {
  ct <- 0
  for (letter in unlist(strsplit(word, ""))) {
    ct <- ct + which(letters %in% letter)
  }
  return(ct)
}))

ct <- 2
tri_vals <- c(1)
while (tri_vals[ct-1] < max(word_vals)) {
  tri_vals <- c(tri_vals, (ct + 1) * ct / 2)
  ct <- ct + 1
}
tri_vals <- tri_vals[tri_vals < max(word_vals)]

print(sum(word_vals %in% tri_vals))