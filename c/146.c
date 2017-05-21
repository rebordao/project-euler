#include "includes/common.h"
#include "includes/primes.h"


const ull NUMS_TO_ADD[6] = {13, 1, 9,  3, 7, 27};


void run() {
    int lim = 10;

    ull max_num = 150 * 1000000;
    ull sum = 0;
    
    for(ull num=10; num<max_num; num+=10) {
        ull squared = num * num;
        if (squared % 9 == 0 ||
            squared % 13 == 0 ||
            squared % 27 == 0 ||
            squared % 3 != 1 ||
            (squared % 7 != 2 && squared % 7 != 3)) {
            continue;
        }
        if (num > lim) {
            printf("%lld \n", num);
            lim = lim * 2;
        }

        bool is_ok = true;

        for (int k=0; k<6; k++) {
            if (is_prime(NUMS_TO_ADD[k] + squared) == false) {
                is_ok = false;
                break;
            }
            
        }
        if (is_ok == true) {
            int count = 0;
            for (ull j=squared; j<squared+28; j++) {
                if(is_prime(j)) {
                    count += 1;
                }
            }
            if (count == 6){
                sum += num;
            }
        }

    }
    printf("%lld", sum);
}


int main() {
    run();
    // GArray * primes = 
    // printf("%lld \n", g_array_index(primes, ull, 0));
    // for (int i=0; i<primes->len; i++) {
    //      ull temp = g_array_index(primes, ull, i);
    //      printf("%lld \n", temp);
    //      if (temp > 100) {
    //         break;
    //      }
    // }
}
