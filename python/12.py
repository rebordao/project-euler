import math

current = 3
idx = 2
while True:
    limit = int(math.floor(math.sqrt(current)))
    count = 0
    for i in range(1, limit + 1):
        if current % i == 0:
            count += 2

    if count >= 500:
        break
    else:
        idx += 1
        current += idx

print(current)
