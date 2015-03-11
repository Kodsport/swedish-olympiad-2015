#!/usr/bin/env python

import re
import sys

line = sys.stdin.readline()
assert re.match('[1-9][0-9]* [12]$', line)
n = int(line.split()[0])
assert 2 <= n <= 1000

line = sys.stdin.readline()
assert len(line) == 0

sys.exit(42)
