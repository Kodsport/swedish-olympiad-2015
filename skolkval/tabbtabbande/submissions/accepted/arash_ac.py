#!/usr/bin/env python3
import sys

line = sys.stdin.readline()
n, m = map(int, line.split())
line = sys.stdin.readline()
nums = map(int, line.split())

ans = 0
now = 0

for num in nums:
    num -= 1
    cost = min([(num-now+100*n)%n, (now-num+100*n)%n])
    ans += cost
    now = num

print(ans)
