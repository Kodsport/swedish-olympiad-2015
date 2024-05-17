#!/usr/bin/env python

import re
import sys

line = sys.stdin.readline()
case, n, strategy, = (int(i) for i in line.split())
assert 2 <= n <= 1000
assert 1 <= case <= 2
assert 0 <= strategy <= 4

line = sys.stdin.readline()
assert len(line) == 0

sys.exit(42)
