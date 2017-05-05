#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <stdint.h>

#include "includes/btree.h"


/* binary search tree */

#define NUM_TYPE unsigned long long

NUM_TYPE number_of_digits(NUM_TYPE *n) {
    return (NUM_TYPE)round(log10((double) *n)) + 1;
}


NUM_TYPE is_pandigital(NUM_TYPE *n) {
    NUM_TYPE size_of_num = number_of_digits(n);

    NUM_TYPE temp = *n;
    NUM_TYPE count = 0;

    node *root = create_node(size_of_num + 1);

    while (temp > 0) {
        NUM_TYPE digit = temp % 10;
        if (digit == 0) {
            dispose(root);
            return false;
        } else {
            node * result = insert_node(root, digit);
            if (result == NULL) {
                dispose(root);
                return false;
            }
        }
        temp /= 10;
    }
    dispose(root);
    return true;
}


int main() {

    node * root = create_node(-1);
    NUM_TYPE sum = 0;

    for (int i=0; i<9999; i++) {
        for (int j=0; j<9999; j++) {
            char buff[50];
            sprintf(buff, "%d%d%d", i,j,i*j);
            NUM_TYPE nr = atoll(buff);

            if (nr >= 1000000000) {
                break;
            }
            if (is_pandigital(&nr) == true && nr >= 100000000 && nr <= 1000000000) {
                node * result = insert_node(root, i * j);
                if (result != NULL) {
                    sum += i*j;
                }
            }
        }   
    }

    printf("%lld\n", sum);

    dispose(root);

    return 0;
}