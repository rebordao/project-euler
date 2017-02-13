# 21 | Names scores
# 
# https://projecteuler.net/problem=22
# 
# Using names.txt (right click and 'Save Link/Target As...'), 
# a 46K text file containing over five-thousand first names, 
# begin by sorting it into alphabetical order. Then working out 
# the alphabetical value for each name, multiply this value by 
# its alphabetical position in the list to obtain a name score.
# 
# For example, when the list is sorted into alphabetical order, 
# COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th 
# name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
# 
# What is the total of all the name scores in the file?

<<<<<<< HEAD
# Imports input data, first set up the working dir to folder `project_euler`
=======
# Imports input data, set working dir to folder project_euler
>>>>>>> aa005b7... Added support to linebreaks if files are executed via command line.
names <- sort(as.character(
  read.csv('./data/p22_names.txt', header = F, sep = ",", stringsAsFactors = F)))

# Gets alphabetical values
values <- sapply(strsplit(names, ""), function(name) {
  sum(sapply(unlist(name), function(letter) {
    which(LETTERS %in% letter)
  }))
})

print(sum(values * 1:length(names)))
