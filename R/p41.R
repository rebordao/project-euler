# 41 | Pandigital prime
# https://projecteuler.net/problem=41
#
# We shall say that an n-digit number is pandigital if it makes
# use of all the digits 1 to n exactly once. For example, 2143
# is a 4-digit pandigital and is also prime.
# 
# What is the largest n-digit pandigital prime that exists?

upper_bound <- 987654321

# any integer is divisible by 3 whose sum of digits is divisible by 3 and then
# the pandigital cannot have 8 or 9 digits. Thus:
upper_bound <- 7654321

is_prime <- function(nr) {
  if (!any(nr %% 2:round(sqrt(nr)) == 0)) {
    return(T)
  }
  return(F)
}

nr <- upper_bound
while (nr >= 2143) {
  nr_str <- unlist(strsplit(as.character(nr), ""))
  if (!any(c(0, 8, 9) %in% nr_str) & length(
    unique(nr_str)) == length(nr_str) & is_prime(nr)) {
    max_pand <- nr
    break
  }
  nr <- nr - 2
}
print(max_pand)