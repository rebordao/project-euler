#include <stdio.h>


unsigned long _sum(unsigned long counts[21][21], unsigned long max_row, unsigned long col) {
    unsigned long sum = 0;
    for (unsigned long i=0; i<=max_row; i++) {
        sum += counts[i][col];
    }
    return sum;
}

unsigned long run () {
    unsigned long counts[21][21];
    for (unsigned long i=0; i<21; i++) {
        for (unsigned long j=0; j<21; j++) {
            if (i == 0 || j == 0) {
                counts[i][j] = 1;
            } else {
                counts[i][j] = 0;
            }
        }
    }
    for (unsigned long i=1; i<21; i++) {
        for (unsigned long j=1; j<21; j++) {
            counts[i][j] = _sum(counts, i, j-1);
        }
    }
    return counts[20][20];
}

int main() {
    printf("%ld", run());
}
