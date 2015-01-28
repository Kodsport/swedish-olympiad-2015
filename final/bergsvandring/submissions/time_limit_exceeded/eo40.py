import sys
import math

def rec(pos, n, d, x, y, dp):
    if pos >= n-1:
        return 0
    if dp[pos] >= 0:
        return dp[pos]
    dp[pos] = float("inf")
    for i in range(pos+1, n):
        dx = x[i] - x[pos]
        dy = y[i] - y[pos]
        angle = float(dy) / dx
        if abs(angle) <= d:
            good = True
            for j in range(pos+1, i):
                angle2 = float(y[j] - y[pos]) / (x[j] - x[pos])
                good = good and angle >= angle2
            if good:
                dp[pos] = min(dp[pos], rec(i, n, d, x, y, dp) + (0 if i == pos+1 else math.sqrt(dx*dx + dy*dy)))
    return dp[pos]

tokens = sys.stdin.readline().split()
n = int(tokens[0])
d = float(tokens[1])
x = [0]*n
y = [0]*n
for i in range(n):
    x[i],y[i] = map(int, sys.stdin.readline().split())

sys.setrecursionlimit(10000)
dp = [-1]*n
res = rec(0, n, d, x, y, dp)
print res if not math.isinf(res) else -1

