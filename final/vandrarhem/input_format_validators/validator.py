#/usr/bin/env python

import re
import sys

re_int = "^[1-9][0-9]*$"

data = []

for line in sys.stdin:
    if line.strip() != "": data.append(line.strip())

N, R = map(int, data[0].split())
assert 1 <= N <= 100
assert 1 <= R <= 5

assert len(data) == R+1

sum_r = 0
for i in range(1, R+1):
    c, r = map(int, data[i].split())
    assert 100 <= c <= 1000
    assert 1   <= r <= 100
    sum_r += r

assert N <= sum_r

sys.exit(42)
