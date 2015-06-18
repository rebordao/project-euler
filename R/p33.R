# 33 | Digit cancelling fractions
# https://projecteuler.net/problem=33
# 
# The fraction 49/98 is a curious fraction, as an inexperienced
# mathematician in attempting to simplify it may incorrectly believe 
# that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
# 
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
# 
# There are exactly four non-trivial examples of this type of fraction,
# less than one in value, and containing two digits in the numerator
# and denominator.
# 
# If the product of these four fractions is given in its lowest common terms, 
# find the value of the denominator.
# 

# There is a nice explanation of this at:
# http://www.roberthorvick.com/2012/07/20/project-euler-problem-33-explained/

# We need to find the 4 non-trivial fractions and 49 / 98 is one of them.
# The other 3 have the following constrains:
# - Both numerator and denominator have 2 digits.
# - The fraction is smaller than 1.
# - They are not mod 10.

get_digits <- function(nr) {
  as.numeric(unlist(strsplit(as.character(nr), '')))
}

ns <- c()
ds <- c()
for (n in 11:98) {
  for (d in (n+1):99) {
    if (n %% 10 != 0 & d %% 10 != 0) {
      digs_n <- get_digits(n)
      digs_d <- get_digits(d)
      comm_nr <- sort(digs_n)[sort(digs_n) == sort(digs_d)][1]
      
      if (!is.na(comm_nr)) {
        if (length(unique(digs_n)) == 1) {
          a <- digs_n[1]
        } else {
          a <- digs_n[digs_n != comm_nr]
        }
        
        if (length(unique(digs_d)) == 1) {
          b <- digs_d[1]
        } else {
          b <- digs_d[digs_d != comm_nr]
        }
        
        if (a / b == n / d) {
          ns <- c(ns, n)
          ds <- c(ds, d)
        }
      }
    }
  }
}

prod(ns) / prod(ds)