#!/usr/bin/env python

import re
import sys

line = sys.stdin.readline()
assert re.match('[1-9][0-9]*$', line)
n = int(line)
assert 1 <= n <= 10000

s = 0
t = 0
for _ in range(n):
    line = sys.stdin.readline()
    assert re.match('(0|[1-9][0-9]*) (0|[1-9][0-9]*)$', line)
    a, b = map(int,line.split())
    s += a - b
    t += a
    assert a > 0 or b > 0

assert s == 0
assert t <= 1e9

line = sys.stdin.readline()
assert len(line) == 0

sys.exit(42)
