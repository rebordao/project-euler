#include "common.h"

sized_digit_array get_digits_array(ull number) {
    ull temp;
    // copy to temp because mutation
    MEM_COPY(&temp, &number);
    ull digit_size = number_of_digits(temp);

    short * arr;
    arr = (short *) malloc((digit_size - 1) * sizeof(short));

    sized_digit_array result = {.arr=arr};
    int count = 0;
    short digit;

    while (temp > 0) {
        digit = (short)(temp % 10);
        arr[count] = digit;

        temp = temp / 10;
        count += 1;
    }
    result.size = count;
    return result;
}

short qsort_short_compare(const void * a, const void * b) {
    return ( *(short*)a - *(short*)b );
}

int number_with_least_digits_ull(ull a, ull b) {
  int size_a = number_of_digits(a);
  int size_b = number_of_digits(b);

  if (size_a > size_b) {
    return size_b;
  } else {
    return size_a;
  }
}

int number_with_least_digits_int(int a, int b) {
    return number_with_least_digits_ull(
        TO_ULL(a), TO_ULL(b)
    );
}

gint glib_ull_compare (gconstpointer node_a, gconstpointer node_b) {
     ull _a = (ull )node_a;
     ull _b = (ull )node_b;
    return _a - _b;
}
gint glib_int_compare (gconstpointer node_a, gconstpointer node_b) {
     long _a = (long )node_a;
     long _b = (long )node_b;
    return (int) _a - _b;
}
gint glib_short_compare (gconstpointer node_a, gconstpointer node_b) {
     long _a = (long )node_a;
     long _b = (long )node_b;
    return (short) _a - _b;
}

