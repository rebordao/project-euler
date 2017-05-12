
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include <glib.h>

#include "includes/common.h"

double product(int * items, int index) {
    double res = 1.0;
    for (int i=0; i<index; i++) {

        if (items[i] != 0) {
            res *= items[i];
        }
    }
    return res;
}

int main() {

  sized_digit_array digits_n;
  sized_digit_array digits_d;
  int ns[50];
  int ds[50];
  int nsds_index = 0;

  int n;
  int d;

  for (n=11; n<99; n++) {
    MEM_COPY(&d, &n);
    while (d < 100) {
        d++;
        if (n % 10 != 0 && d % 10 != 0) {
            digits_n = get_digits_array(n);
            digits_d = get_digits_array(d);

            if (digits_n.arr[0] == digits_d.arr[1]) {
                short a = digits_n.arr[1];
                short b = digits_d.arr[0];

                if ((double)a / (double)b == (double)n / (double)d) {
                    ns[nsds_index] = n;
                    ds[nsds_index] = d;
                    nsds_index += 1;
                }
            
            }
        }

    }
  }
  printf("%lf \n%lf \n%lf\n", product(ns, nsds_index), product(ds, nsds_index), product(ns, nsds_index) /product(ds, nsds_index));

  return 0;
}
