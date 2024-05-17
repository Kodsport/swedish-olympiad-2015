#!/usr/bin/env python3

import re
import sys

re_int = "^(0|[1-9][0-9]*)$"

line = sys.stdin.readline()
assert re.match(re_int, line)

n = int(line)
assert 1 <= n <= 10000

line = sys.stdin.readline()
assert len(line) == 0

sys.exit(42)
