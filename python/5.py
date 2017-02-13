current = 2520
numbers = list(range(11, 21))


def divisible_by_all(n):
    for number in numbers:
        if n % number != 0:
            return False
    else:
        return True


while True:
    if divisible_by_all(current):
        break
    else:
        current += 20

print(current)
