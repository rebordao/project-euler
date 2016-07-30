# for later use http://www.cecm.sfu.ca/personal/pborwein/PAPERS/P29.pdf

num = 1
for i in range(1, 101):
    num *= i

print(sum([int(i) for i in str(num)]))
