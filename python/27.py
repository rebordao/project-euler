from common import Calculator


calc = Calculator(1000)
primes = set(calc.primes)


a_res = 0
b_res = 0
num_of_primes = 0

max_count = 0
coefficent_product = 0

for b in range(-1000, 1000):
    for a in range(-1000, 1000):
        count = 1

        while (count*count + a*count + b) in primes:
            count += 1

        if count > max_count:
            max_count = count
            coefficent_product = a * b

print(coefficent_product)
