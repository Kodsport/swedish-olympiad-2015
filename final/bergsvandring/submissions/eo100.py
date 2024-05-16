#!/usr/bin/python3

import sys
import math

def rec(pos, n, d, x, y, dp):
    if pos >= n-1:
        return 0
    if dp[pos] >= 0:
        return dp[pos]
    dp[pos] = float("inf")
    highest = -100*d
    for i in range(pos+1, n):
        dx = x[i] - x[pos]
        dy = y[i] - y[pos]
        angle = float(dy) / dx
        if abs(angle) <= d and angle >= highest:
            dp[pos] = min(dp[pos], rec(i, n, d, x, y, dp) + (0 if i == pos+1 else math.sqrt(dx*dx + dy*dy)))
        highest = max(highest, angle)
    return dp[pos]

tokens = sys.stdin.readline().split()
n = int(tokens[0])
d = float(tokens[1])
x = [0]*n
y = [0]*n
for i in range(n):
    x[i],y[i] = list(map(int, sys.stdin.readline().split()))

sys.setrecursionlimit(10000)
dp = [-1]*n
res = rec(0, n, d, x, y, dp)
print(res if not math.isinf(res) else -1)

