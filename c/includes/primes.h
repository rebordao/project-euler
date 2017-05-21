#ifndef __EULER_PRIMES__
#define __EULER_PRIMES__

#include "common.h"

#ifdef __cplusplus
extern "C" {
#endif

bool is_prime(ull n);
GArray * sieve(ull n);

#ifdef __cplusplus
}
#endif

#endif
