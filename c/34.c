
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
