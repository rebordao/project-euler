/*
# 34 | Digit Factorials
# https://projecteuler.net/problem=34
# 
# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
# 
# Find the sum of all numbers which are equal to the sum of the
# factorial of their digits.
# 
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

# A Curious Number is also known as a factorion.
# https://en.wikipedia.org/wiki/Factorion
# In this article they say that there are just 4 factorions (in base 10).

get_digits <- function(nr) {
  as.numeric(unlist(strsplit(as.character(nr), '')))
}

# The difficulty is to find an upper bound.
# We know n is natural and if it has d digits, then
# 10^(d-1) <= n <= 9! * d
# this fails for d >= 8 thus n has at most 7 digits
# and a first upper bound could be 9999999
# but the maximum sum of a number with 7 digits is 9! * 7
# thus this becomes a second upper bound

upper_bound <- factorial(9) * 7

curious_nrs <- unlist(sapply(3:upper_bound, function(nr) {
  if (sum(factorial(get_digits(nr))) == nr) {
    return(nr)
  }
}))

print(curious_nrs)
print(sum(curious_nrs))
*/


#include "includes/common.h"

int factorial(int n) {
    int i;
    int f = 1;

    for(i=1; i<=n; i++) {
        f *= i;
    }
    return f;
    
}

int main () {
    ull limit = factorial(9) * 7;
    
    int total_sum = 0;
    for (int i=3; i<= limit; i++) {

        sized_digit_array arr = get_digits_array(TO_ULL(i));
        int sum = 0;

        for (int j=0; j<arr.size; j++) {
            sum += factorial(arr.arr[j]);
        }
        if (sum == i) {
            total_sum += i;
        }
    }
    printf("%d", total_sum);
}
