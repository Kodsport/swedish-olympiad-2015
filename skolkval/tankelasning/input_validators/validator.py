#!/usr/bin/env python3

import re
import sys

re_int = "^(0|[1-9][0-9]*)$"

line = sys.stdin.readline()
assert re.match(re_int, line)

n = int(line)
assert 1 <= n <= 10

for i in range(n):
    line = sys.stdin.readline()
    assert re.match("^[+\\-*/] [0-9x]$", line)
    assert line != "/ 0" and line != "/ x"

assert not sys.stdin.readline()
sys.exit(42)
