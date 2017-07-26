# 17 | Number Letter Counts
# https://projecteuler.net/problem=17
# 
# If the numbers 1 to 5 are written out in words: 
# one, two, three, four, five, 
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
# 
# If all the numbers from 1 to 1000 (one thousand) 
# inclusive were written out in words, how many letters would be used?
# 
# NOTE: Do not count spaces or hyphens. For example, 
# 342 (three hundred and forty-two) contains 23 letters and 115 
# (one hundred and fifteen) contains 20 letters. The use of 'and'
# when writing out numbers is in compliance with British usage.

# Builds units' list
units <- c('', unlist(
  strsplit("one two three four five six seven eight nine", " ", "")))

# Builds teens' list
teens <- "eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen"
teens <- unlist(strsplit(teens, " ", ""))

# Builds tens' list
tens <- "ten twenty thirty forty fifty sixty seventy eighty ninety"
tens <- c('', unlist(strsplit(tens, " ", "")))

# Creates words for nrs = 1:19
words <- c(units[2:10], "ten", teens)

# Creates words for nrs = 20:99
nrs <- 20:99
words <- c(words, paste(tens[floor(nrs / 10) + 1], units[nrs %% 10 + 1]))

# Creates words for nrs = 100:999
nrs <- 100:999

# All cases
aux <- paste(units[floor(nrs / 100) + 1], "hundred and", tens[
  floor(nrs / 10) %% 10 + 1], units[nrs %% 10 + 1])

# Rewrites cases 100, 200, ..., 900
aux[which(nrs %% 100 == 0)] <- paste(units, "hundred")[2:10]
idxs <- which((nrs %% 100) %in% 11:19)

# Rewrites cases 111, 112, ... 119, 211, 212, 219, ..., 911, 912, ..., 919
aux[idxs] <- unlist(lapply(idxs, function(idx) {
  paste(paste(
    unlist(strsplit(aux[idx], " ", ""))[1:3], collapse = " "), 
    teens[nrs[idx] %% 10], collapse = "")
  }))

# Adds case nr = 1000
words <- c(words, aux, "one thousand")

# Removes white spaces
all_letters <- gsub(
  pattern = " ", replacement = "", x = paste(words, collapse = ""))

# Splits string and prints its length
print(length(unlist(strsplit(all_letters, "", ""))))
