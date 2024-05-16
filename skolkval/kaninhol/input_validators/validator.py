#!/usr/bin/python3
import re
import sys

line = sys.stdin.readline().strip()
n = int(line)
line = sys.stdin.readline().strip()
nums = [*map(int, line.split())]

assert 2 <= n <= 10
assert set(nums) == { i for i in range(1, n+1) }

line = sys.stdin.readline()
assert len(line) == 0


# Check the number of different solutions
def simulate(order, hole):
    inHole = order[-hole:]

    return inHole[::-1] + order[:-hole]

numAns = 0

for h1 in range(1,n):
    for h2 in range(1,n):
        for h3 in range(1,n):
            currOrder = [*range(1,n+1)][::-1]

            currOrder = simulate(currOrder, h1)
            currOrder = simulate(currOrder, h2)
            currOrder = simulate(currOrder, h3)
            #print(currOrder, nums)
            if currOrder == nums:
                print(h1,h2,h3)
                numAns += 1
    
assert numAns == 1




sys.exit(42)
