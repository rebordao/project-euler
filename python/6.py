sum_of_squares = 0
sum = 0

for i in range(1, 101):
    sum_of_squares += i ** 2
    sum += i

result = sum ** 2 - sum_of_squares
print(result)
