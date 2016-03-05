import itertools

temp = itertools.islice(itertools.permutations("0123456789"), 999999, None)
print("".join(next(temp)))
# 2783915460
