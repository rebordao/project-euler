# 43 | Sub-string divisibility
# https://projecteuler.net/problem=43
#
# The number, 1406357289, is a 0 to 9 pandigital number because it
# is made up of each of the digits 0 to 9 in some order, but it also
# has a rather interesting sub-string divisibility property.
# 
# Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way,
# we note the following:
#   
# d2d3d4=406 is divisible by 2
# d3d4d5=063 is divisible by 3
# d4d5d6=635 is divisible by 5
# d5d6d7=357 is divisible by 7
# d6d7d8=572 is divisible by 11
# d7d8d9=728 is divisible by 13
# d8d9d10=289 is divisible by 17
# Find the sum of all 0 to 9 pandigital numbers with this property.

# cands <- 0123456789:9876543210

# But this is too much to test using the computer thus let's do it by hand

# d6 must be 0 or 5
# but as d6d7d8 must be divisible by 11, then d6 must be 5 (011, 022 cannot be)
# and thus d6d7d8 must be either 506 517 528 539 561 572 583 594
# then d7d8d9 must be either 06x, 17x, 39x, 61x, 72x, 83x, 94x
# and divisible by 13, then it needs to be 5286, 5390, 5728, 5832
# and d8d9d10 %% 17 == 0, then 52867, 53901, 57289
# d5d6d7 %% 7 == 0 and ends in 52, 53, 57, then d5 = 9 or 3,
# 952867 or 357289
# d2d3d4 %% 2, then 0952867, 4952867 or 0357289, 4357289, 6357289
# d3d4d5 %% 3, then 30952867, 60357289, 06357289
# now only 1 and 4 are left, thus
# we can get 130952867, 430952867, 160357289, 460357289, 106357289, 406357289
print(sum(c(130952867, 430952867, 160357289, 460357289, 106357289, 406357289)))
