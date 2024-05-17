#!/usr/bin/env python3

import re
import sys

re_int = "^(0|[1-9][0-9]*)$"


num = sys.stdin.readline()
assert re.match(re_int, num)

line = sys.stdin.readline().split()
for x in line:
    assert re.match(re_int, x)

eof = sys.stdin.readline()
assert len(eof) == 0




# Arash Rouhani 2014, progolymp.se
n = int(num)
assert 2 <= n <= 35

values = [*map(int, line)]
assert len(line) == n, f"{line = } {n = }"
assert len(values) == n

assert sum(values) <= 1000

mean = sum(values)/2

dp = { (0, 2000): 1 }
for x in values:
    new_dp = dict(dp)
    for k,v in dp.items():
        new_k = (k[0] + x, min(x, k[1]))
        new_dp[new_k] = new_dp.get(new_k, 0) + v
    dp = new_dp

res = sum(v for k,v in dp.items() if k[0] > mean and k[0]-k[1] <= mean)
assert res <= 2e9 # Make sure the answer is <= 2e9






sys.exit(42)
