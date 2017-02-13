# 5 | Smallest multiple
<<<<<<< HEAD
=======
# 
>>>>>>> aa005b7... Added support to linebreaks if files are executed via command line.
# https://projecteuler.net/problem=5
# 
# 2520 is the smallest number that can be divided by each of the numbers from 
# 1 to 10 without any remainder. What is the smallest positive number that is 
# evenly divisible by all of the numbers from 1 to 20?

<<<<<<< HEAD
#### Tweaked brute-force solution ####
# takes 23 seconds in my 6 years-old laptop
=======
# Tweaked brute-force solution, only takes 32 seconds in my 6 years-old laptop
>>>>>>> aa005b7... Added support to linebreaks if files are executed via command line.

nr <- 20
while (sum(nr %% 11:20) > 0L) {
  # if it's divisible by 14, 15, 16, 18 and 20, it's also by {1, 2, ..., 10}
  nr <- nr + 20L # checks only for multiples of 20
}
<<<<<<< HEAD
print(nr)

#### Prime Factorization ####

# Let N be the number that we want to find
# Then N needs to be divisible by all nrs 2:k

# For k = 2, N = 2,
# For k = 3, N = 2 * 3
# For k = 4, N = 2 * 3 * 2
# For k = 5, N = 2 * 3 * 2 * 5
# For k = 6, N = 2 * 3 * 2 * 5
# For k = 7, N = 2 * 3 * 2 * 5 * 7
# For k = 8, N = 2 * 3 * 2 * 5 * 7 * 2
# For k = 9, N = 2 * 3 * 2 * 5 * 7 * 2 * 3
# For k = 10, N = 2 * 3 * 2 * 5 * 7 * 2 * 3
# For k = 11, N = 2 * 3 * 2 * 5 * 7 * 2 * 3 * 11
# For k = 12, N = 2 * 3 * 2 * 5 * 7 * 2 * 3 * 11
# For k = 13, N = 2 * 3 * 2 * 5 * 7 * 2 * 3 * 11 * 13
# For k = 14, N = 2 * 3 * 2 * 5 * 7 * 2 * 3 * 11 * 13
# For k = 15, N = 2 * 3 * 2 * 5 * 7 * 2 * 3 * 11 * 13
# For k = 16, N = 2 * 3 * 2 * 5 * 7 * 2 * 3 * 11 * 13 * 2
# For k = 17, N = 2 * 3 * 2 * 5 * 7 * 2 * 3 * 11 * 13 * 2 * 17
# For k = 18, N = 2 * 3 * 2 * 5 * 7 * 2 * 3 * 11 * 13 * 2 * 17
# For k = 19, N = 2 * 3 * 2 * 5 * 7 * 2 * 3 * 11 * 13 * 2 * 17 * 19
# For k = 20, N = 2 * 3 * 2 * 5 * 7 * 2 * 3 * 11 * 13 * 2 * 17 * 19
print(2 * 3 * 2 * 5 * 7 * 2 * 3 * 11 * 13 * 2 * 17 * 19)

# How to do this programmatically?
# TODO
=======
print(nr)
>>>>>>> aa005b7... Added support to linebreaks if files are executed via command line.
