#!/usr/bin/env python3
# Arash Rouhani 2014, progolymp.se
import math

n = int(input())
values = [*map(int, input().split())]
assert len(values) == n

mean = sum(values)/2

dp = { (0, 2000): 1 }
for x in values:
    new_dp = dict(dp)
    for k,v in dp.items():
        new_k = (k[0] + x, min(x, k[1]))
        new_dp[new_k] = new_dp.get(new_k, 0) + v
    dp = new_dp

res = sum(v for k,v in dp.items() if k[0] > mean and k[0]-k[1] <= mean)
assert res <= 2e9, f"{res = }"
print(res)
