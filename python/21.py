# could be optimized


def calc(n):
    for i in range(2, n):
        nums = range(1, i-1)
        b = sum([j for j in nums if i % j == 0])
        nums = range(1, b - 1)
        if (b > 1):
            a = sum([k for k in nums if b % k == 0])
            if (a == i and a != b):
                yield i


print(sum(calc(10000)))
