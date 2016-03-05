from common import Calculator


limit = 28123
calc = Calculator(28123)
abundant_numbers = calc.abundant_numbers()
_sum = 0

result = list(range(limit+1))

for i in range(0, len(abundant_numbers)):
    for j in range(i, len(abundant_numbers)):
        number = abundant_numbers[i] + abundant_numbers[j]

        if (number <= limit):
            result[number] = 0
        else:
            break

print(sum(result))
# 4179871
