possible_numbers = []
# This can probably be optmized, by doing 999, 700, -1 first
# If processed in batches few numbers will be excluded

for i in range(999, 99, -1):
    for j in range(999, 99, -1):
        result = str(i * j)
        a, b = result[0:3], result[3:]
        b_reversed = b[::-1]
        if a == b_reversed:
            possible_numbers.append(result)

result = sorted(possible_numbers)[-1]
print(result)
