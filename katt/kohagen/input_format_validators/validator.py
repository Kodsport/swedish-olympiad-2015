#/usr/bin/env python
import sys
import re

re1 = '''^(0|[1-9][0-9]*) (0|[1-9][0-9]*) (0|[1-9][0-9]*)$'''
line = sys.stdin.readline() 
assert re.match(re1, line)
n, m, r = map(int, line.split())
assert 4 <= n <= 400
assert 1 <= m <= 1000000000
assert 1 <= r <= 1000

re2 = '''^([0-9]*\.?[0-9]*)( [0-9]*\.?[0-9]*)*$'''
line = sys.stdin.readline()
assert re.match(re2, line)
a = map(float, line.split())
assert len(a) == n
for e in a:
    assert 0.0 <= e < 360.0

line = sys.stdin.readline()
assert len(line) == 0

sys.exit(42)
