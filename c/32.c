#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <stdint.h>

#include "includes/btree.h"


/* binary search tree */

ull is_pandigital(ull *n) {
    ull size_of_num = number_of_digits(*n);

    ull temp = *n;
    ull count = 0;

    node *root = ull_create_node(size_of_num + 1);

    while (temp > 0) {
        ull digit = temp % 10;
        if (digit == 0) {
            dispose(root);
            return false;
        } else {
            node * new_node = ull_create_node(digit); 
            node * result = insert_node(root, new_node, ull_compare_lower);
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
    node * root = ull_create_node(-1);
    ull sum = 0;

    for (int i=0; i<9999; i++) {
        for (int j=0; j<9999; j++) {
            char buff[50];
            sprintf(buff, "%d%d%d", i,j,i*j);
            ull nr = atoll(buff);

            if (nr >= 1000000000) {
                break;
            }
            if (is_pandigital(&nr) == true && nr >= 100000000 && nr <= 1000000000) {
                node * new_node = ull_create_node(i * j); 
                node * result = insert_node(root, new_node, ull_compare_lower);
                if (result != NULL) {
                    sum += i*j;
                } else {
                    free(new_node);
                }
            }
        }   
    }

    printf("%lld\n", sum);

    dispose(root);

    return 0;
}