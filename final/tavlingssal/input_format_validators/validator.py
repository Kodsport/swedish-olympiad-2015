#!/usr/bin/python3

import re
import sys

re_int = "^[1-9][0-9]*$"

data = []

for line in sys.stdin:
	if line.strip() != "": data.append(line.strip())

n = int(data[0])
assert re.match(re_int, data[0])
assert n >= 1
assert n <= 10**9	
assert len(data) == 1

sys.exit(42)
