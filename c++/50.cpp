#include <iostream>
#include <vector>

extern "C" {
    #include "../c/includes/common.h"
    #include "../c/includes/primes.h"
    GArray * sieve(ull n);
}

bool in_garray(GArray * arr, ull total) {
    for (unsigned int i=0; i<arr->len; i++) {
         ull temp = g_array_index(arr, ull, i);
         if (temp == total) {
             return true;
         }
    }
    return false;
}


int main() {


    ull limit = 999999 * 2 + 1;
    GArray * prime_list = sieve(limit);

    unsigned int index_to_use = 0;
    unsigned int start_to_use = 0;

    for (unsigned int start = 0; start < 10; start++) {
        unsigned int i = 0;
        ull total = 0;

        for (unsigned  int prime_start = start; prime_start < prime_list -> len; prime_start++) {
            ull prime = g_array_index(prime_list, ull, prime_start);
            total = total + prime;

            if (total > limit) {
                break;
            }

            i += 1;

            if (in_garray(prime_list, total)) {
                if (i > index_to_use) {
                    index_to_use = i;
                    start_to_use = start;
                }

            }
        }
        
    }
    ull total = 0;
    for (unsigned int i = start_to_use; i <= index_to_use + 2; i++) {
        total += g_array_index(prime_list, ull, i);
    }
    std::cout << total << "\n";

    return 0;
}
