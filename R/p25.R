# 25 | 1000-digit Fibonacci number
# The Fibonacci sequence is defined by the recurrence relation:
#
# Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:
# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144
# The 12th term, F12, is the first term to contain three digits.
# 
# What is the first term in the Fibonacci sequence to contain 1000 digits?

# Check the two methodogies described at 
# http://www.mathblog.dk/project-euler-25-fibonacci-sequence-1000-digits/

# I used 2 methods to solve this: 
# - limit of a fibonacci sequence
# - Binet's formula

#### Limit of a fibonacci sequence ####

# The limit converges to round((golden_ratio ^ n) / sqrt(5))
# Finding a digit with 1000 digits is the same as having a nr > 10^999
# Thus let's compute (golden_ratio^n / sqrt(5)) = 10^999 <=> 
# log((golden_ratio^n / sqrt(5))) = log(10^999), base 10 <=> 
# log(golden_ratio^n) - log(sqrt(5)) = log(10) * 999 <=>
# n * log(golden_ratio) - log(5) / 2 = log(10) * 999 <=>
# n = ((log(10) * 999) + log(5) / 2) / log(golden_ratio)

golden_ratio = (1 + sqrt(5)) / 2
print(round((log(10) * 999 + (log(5) / 2)) / log(golden_ratio)))

#### Using Binet's formula ####

# The following approach breaks for large numbers

# library(gmp)
# get_fib_seq <- function(n, golden_ratio) {
#   "
#   Computes Fibonacci Sequence in Closed Form.
#   http://en.wikipedia.org/wiki/Fibonacci_number#Closed-form_expression
#   "
#   # Without big number support, this would not be possible
#   as.bigz((golden_ratio^n - (-golden_ratio)^-n) / sqrt(5)) # Binet's formula
# }
#
# 
# nr <- 10
# floor(log(get_fib_seq(1:100, golden_ratio), base = 10)) + 1

# The following approach is nice, but doesn't work
# It's about computing the terms using a transformation matrix
# http://fusharblog.com/solving-linear-recurrence-for-programming-contest/

# library(expm) # for exponents of matrices
# ct <- 0
# stop_criteria <- F
# while (!stop_criteria) {
#   ct <- ct + 1
#   out <- as.bigz(t(m %^% ct) * c(1,1))  
#   stop_criteria <- floor(log(out[2,2])) + 1 >= 1000
# }
