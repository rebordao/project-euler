#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>

#include <glib.h>

// MACROS // 
#define true 1
#define false 0

// STMT START/END is a concept stolen from glib
// SEE https://github.com/bratsche/glib/blob/38e2273207783e4396aabd47bdab5f28155ad6ae/glib/gmacros.h#L245
#define STMT_START do
#define STMT_END while (0)

#define ull unsigned long long
#define number_of_digits(n) ((ull)round(log10(n)) + 1)
// for gpointer see https://developer.gnome.org/glib/stable/glib-Type-Conversion-Macros.html
#define PTR_CAST(i) ((gpointer) (gulong) (i))
#define ARRAY_SIZE(arr) (sizeof(arr) / arr[0])

#define MEM_COPY(ptr_dest, ptr_origin) \
    memcpy(ptr_dest, ptr_origin, sizeof(*ptr_origin)); \

#define TO_ULL(n) ((ull) (n))

// TODO
#define _SHORT_SORT(i) \
    qsort (i.arr, i.size, sizeof(short), qsort_short_compare);


// END OF MACROS //

// STRUCTS //

typedef struct sized_digit_array {
    short * arr;
    unsigned int size;
} sized_digit_array;

// END OF STRUCTS //

// FUNCTIONS //

sized_digit_array get_digits_array(ull number);
short qsort_short_compare (const void * a, const void * b); 
int number_with_least_digits_ull(ull a, ull b);
int number_with_least_digits_int(int a, int b);

// GLIB FUNCTIONS //
// TODO boilerplate
gint glib_ull_compare (gconstpointer node_a, gconstpointer node_b);
gint glib_int_compare (gconstpointer node_a, gconstpointer node_b);
gint glib_short_compare (gconstpointer node_a, gconstpointer node_b);
// END OF GLIB FUNCTIONS //

// END OF FUNCTIONS //
