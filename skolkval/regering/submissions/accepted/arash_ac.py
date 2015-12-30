# Arash Rouhani 2014, progolymp.se
import math

n = map(int, raw_input().split())[0]
values = map(int, raw_input().split())
assert len(values) == n

mean = sum(values)/2

dp = { (0, 2000): 1 }
for x in values:
    new_dp = dict(dp)
    for k,v in dp.iteritems():
        new_k = (k[0] + x, min(x, k[1]))
        new_dp[new_k] = new_dp.get(new_k, 0) + v
    dp = new_dp

res = sum(v for k,v in dp.iteritems() if k[0] > mean and k[0]-k[1] <= mean)
assert res <= 2e9
print res
