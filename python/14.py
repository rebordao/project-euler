limit = int(1e6)  # 1 million


try:
    _range = xrange
except ImportError:
    _range = range


def collatz_seq(start):
    current = start
    count = 0

    while True:
        count += 1
        if current == 1:
            break
        if current % 2 == 0:
            current = current / 2
        else:
            current = (3 * current) + 1

    return count

_max = -1
number = -1

for i in _range(13, limit):
    result = collatz_seq(i)
    if result > _max:
        _max = result
        number = i

print(number)
