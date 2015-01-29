#!/usr/bin/env python

import sys
import re

line = sys.stdin.readline()
assert re.match(r'[1-9][0-9]* (\d*[.])?\d+$', line)
tokens = line.split()
assert len(tokens) == 2

n = int(tokens[0])
d = float(tokens[1])
assert 2 <= n <= 1000
assert 0 < d <= 10**5

prevX = -1
for i in range(n):
    line = sys.stdin.readline()
    assert re.match(r'(0|[1-9][0-9]*) (0|[1-9][0-9]*)$', line)
    tokens = line.split()
    assert len(tokens) == 2
    x,y = map(int, tokens)
    assert prevX < x <= 10**6
    assert 0 <= y <= 10**6
    prevX = x

assert len(sys.stdin.readline()) == 0

sys.exit(42)
