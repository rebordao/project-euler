#include <stdint.h>

#include <glib.h>

#include "includes/common.h"


ull is_pandigital(ull *n) {
    ull temp = *n;
    GTree * mytree = g_tree_new(glib_ull_compare);

    while (temp > 0) {
        ull digit = temp % 10;
        if (digit == 0) {
            g_tree_destroy(mytree);
            return false;
        } else {
                gpointer result = g_tree_lookup (mytree,  PTR_CAST(digit));
                if (result == NULL) {
                    g_tree_insert (mytree,  PTR_CAST(digit),  PTR_CAST(digit));
                } else {
                    g_tree_destroy(mytree);
                    return false;
                }
        }
        temp /= 10;
    }
    g_tree_destroy(mytree);
    return true;
}


int main() {
    GTree * mytree = g_tree_new(glib_ull_compare);

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
                ull temp = i * j;
                
                gpointer result = g_tree_lookup (mytree,  PTR_CAST(temp));

                if (result == NULL) {
                    sum += temp;
                    g_tree_insert (mytree,  PTR_CAST(temp),  PTR_CAST(temp));
                    g_tree_ref (mytree);
                }
            }
        }   
    }

    printf("%lld\n", sum);
    g_tree_destroy(mytree);

    return 0;
}