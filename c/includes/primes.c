#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

#include <string.h>
#include "common.h"
#include "primes.h"


/* 
TODO need a more efficient long pow

Python has a really good long pow so probably port that

https://github.com/python/cpython/blob/918403cfc3304d27e80fb792357f40bb3ba69c4e/Objects/longobject.c#L4048

part of this process is to also get KARATSUBA mul:
https://github.com/python/cpython/blob/918403cfc3304d27e80fb792357f40bb3ba69c4e/Objects/longobject.c#L3266

TODO: investigate openmp
*/

ull modpow(ull a, ull d, ull m) {
    ull c = a;
    for (ull i = 1; i < d; i++)
        c = (c*a) % m;
    return c % m;
}


bool is_strong_pseudoprime(ull n, int a) {
    /*
    The bitwise shift would save calculation on bigger numbers, not a big difference up to 150million
    leaving in incase is needed
    https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test
    */
    ull d = n - 1;
    ull s = 0;

    while (d % 8 == 0 && d != 0) {
        d = d >> 2;
        s = s + 3;
    }

    while (d % 2 == 0 && d != 0) {
        d = d / 2;
        s = s + 1;
    }

    ull t = modpow(a, d, n);

    if (t == 1) {
        return true;
    }

    while (s > 0) {
        if (t == n - 1) {
            return true;
        }
        t = modpow(t, 2, n);
        s = s - 1;
    }

    return false;
}


const ull arr_2047[1] = {2};
const ull arr_1373653[2] = {2, 3};
const ull arr_9080191[2] = {31, 73};
const ull arr_25326001[3] = {2, 3, 5};
const ull arr_3215031751[4] = {2, 3, 5, 7};
const ull arr_4759123141[3] = {2, 7, 61};
const ull arr_1122004669633[4] = {2, 13, 23, 1662803};
const ull arr_2152302898747[5] = {2, 3, 5, 7, 11};
const ull arr_3474749660383[6] = {2, 3, 5, 7, 11, 13};
const ull arr_341550071728321[7] = {2, 3, 5, 7, 11, 13, 17};
const ull arr_3825123056546413051[9] = {2, 3, 5, 7, 11, 13, 17, 19, 23};
const ull arr_else[12] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37};


const ull * get_miller_rabin_array(ull n) {

    if (n < 2047) {
        return arr_2047;
    }
    else if (n < 1373653) {
        return arr_1373653;
    }
    else if (n < 9080191) {
        return arr_9080191;
    }
    else if (n < 25326001){
        return arr_25326001;
    }
    else if (n < 3215031751){
        return arr_3215031751;
    }
    else if (n < 4759123141){
        return arr_4759123141;
    }
    else if (n < 1122004669633){
        return arr_1122004669633;
    }
    else if (n < 2152302898747){
        return arr_2152302898747;
    }
    else if (n < 3474749660383){
        return arr_3474749660383;
    }
    else if (n < 341550071728321){
        return arr_341550071728321;
    }
    else if (n < 3825123056546413051){
        return arr_3825123056546413051;
    } else {
        return arr_else;
    }
}

bool is_prime(ull n) {
    /*
    For the pyramid of doom see https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test
    section Deterministic variants

    if n < 2,047, it is enough to test a = 2;
    if n < 1,373,653, it is enough to test a = 2 and 3;
    if n < 9,080,191, it is enough to test a = 31 and 73;
    if n < 25,326,001, it is enough to test a = 2, 3, and 5;
    if n < 3,215,031,751, it is enough to test a = 2, 3, 5, and 7;
    if n < 4,759,123,141, it is enough to test a = 2, 7, and 61;
    if n < 1,122,004,669,633, it is enough to test a = 2, 13, 23, and 1662803;
    if n < 2,152,302,898,747, it is enough to test a = 2, 3, 5, 7, and 11;
    if n < 3,474,749,660,383, it is enough to test a = 2, 3, 5, 7, 11, and 13;
    if n < 341,550,071,728,321, it is enough to test a = 2, 3, 5, 7, 11, 13, and 17.

    */
    if (n == 1) {
        return false;
    }

    if (n % 2 == 0) {
        if (n == 2) {
            return true;
        } else {
            return false;
        }
    }

    const ull * arr = get_miller_rabin_array(n);

    for(unsigned int i=0; i<sizeof(arr) / sizeof(ull); i++) {
        if (is_strong_pseudoprime(n, arr[i]) == false) {
            return false;
        }
    }

    return true;
}

GArray * sieve(ull n) {

    ull limit = (n + 1) >> 1;
    ull i = 0;
    // ull j = 3;
    ull cursor;
    
    ull * arr;
    arr = (ull *) malloc(limit * sizeof(ull));

    // #pragma omp parallel for private(i) shared(arr, limit)
    for (i=0; i<limit; i++) {
        arr[i] = 1;
    }
    arr[0] = 0;

    // #pragma omp parallel for shared(arr, limit) private(i, cursor)
    for(i=3; i < limit; i+=2) {
        if (arr[i] == 1) {
            for (cursor=i * i; cursor < limit; cursor+=2*i) {
                arr[cursor] = 0;
            }
        }
    }

    GArray * garray = g_array_new (FALSE, FALSE, sizeof(ull));

    ull two = 2;
    g_array_append_val(garray, two);

    for (ull i = 1; i < limit; i+=2) {
        if (arr[i] == 1 && i != 1) { // TODO improve
            g_array_append_val(garray, i);
        }
    }

    free(arr);

    return garray;

}
