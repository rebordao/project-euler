#include <stdio.h>

int main () {
    unsigned long long sum = 0;
    for (unsigned long long i=1; i<=500; i++) {
        sum += (4 * (i * i) + i + 1);
    }
    sum *= 4;
    sum += 1;
    printf("%lld\n", sum);
}
