import re
import sys

int_regex = "(0|[1-9][0-9]*)"
intspace_regex = int_regex + "( " + int_regex+")*"
line_regex = "^" + intspace_regex + "$"

line = sys.stdin.readline()
assert re.match(line_regex, line)
n, k = [int(x) for x in line.split()]

assert 1 <= n <= 15 and 1 <= k <= 15

for i in range(2):
    line = sys.stdin.readline()
    assert re.match(line_regex, line)
    nums = [int(x) for x in line.split()]
    assert len(nums) == n # check that each line have exactly n numbers
    assert len([x for x in nums if x > 1000 or x < 0]) == 0 # check that all numbers are <= 1000

line = sys.stdin.readline()
assert len(line) == 0

sys.exit(42)
