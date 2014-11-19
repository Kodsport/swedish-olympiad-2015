import re
import sys

line = sys.stdin.readline().strip()
n = int(line)
line = sys.stdin.readline().strip()
nums = map(int, line.split())

assert 1 <= n <= 10
assert set(nums) == { i for i in range(1, n+1) }

line = sys.stdin.readline()
assert len(line) == 0

sys.exit(42)
