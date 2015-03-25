import math


limit = 4e6  # 4 million
fi = (1 + math.sqrt(5)) / 2

max_index = (math.log(limit) + math.log(5) / 2) / math.log(fi)
max_index = int(math.floor(max_index))


def fib_number(n, fi):
    return int((fi**n - (-fi**-n)) / math.sqrt(5))


def fib(start, end, exclude=None):
    for n in range(start, end):
        number = fib_number(n, fi)

        if exclude is None:
            yield number
        elif exclude(number) is False:
            yield number

even_numbers = fib(1, max_index + 1, exclude=lambda x: x % 2 != 0)

print(sum(even_numbers))
