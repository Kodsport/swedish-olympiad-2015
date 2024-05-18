#!/usr/bin/env python

import re
import sys

re_int = "(0|[1-9][0-9]*)"

two_ints = "^" + re_int + " " + re_int + "$"

line = sys.stdin.readline()

assert re.match(two_ints, line)

N, M = map(int, line.split())

assert 1 <= N <= 100000
assert 0 <= M <= 200000

seen = set()

for i in range(M):
    line = sys.stdin.readline()
    assert re.match(two_ints, line)
    a, b = map(int, line.split())
    assert 1 <= a < b <= N
    assert (a, b) not in seen
    seen.add( (a, b) )

line = sys.stdin.readline()
assert len(line) == 0

sys.exit(42)
