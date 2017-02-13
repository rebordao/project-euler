import math


# F(n) = [  phi^n / sqrt(5) ]
# phi ^ n / sqrt(5) > 10^999
# log(phi) * n - log(5) / 2 > log(10) * 999
# n > (log(10) * 999 + log(5) / 2) / log(phi)
phi = (1 + math.sqrt(5)) / 2
a = math.log(10) * 999 + math.log(5) / 2
b = math.log(phi)
print(int(round(a / b)))
