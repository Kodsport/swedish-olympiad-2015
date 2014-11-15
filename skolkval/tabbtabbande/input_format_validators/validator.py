import re
import sys

re_pair_int = "^(0|[1-9][0-9]*) (0|[1-9][0-9]*)$"

line = sys.stdin.readline()
assert re.match(re_pair_int, line)

n, m = map(int, line.split())
assert 1 <= n < 10
assert 1 <= m < 10

line = sys.stdin.readline()
nums = map(int, line.split())

assert m == len(nums)
for x in nums:
    assert 1 <= x <= n

# Kolla inga intilligande samma siffror
assert min([ abs(a-b) for (a, b) in zip(nums, nums[1:]) ]) > 0

line = sys.stdin.readline()
assert len(line) == 0

sys.exit(42)
