#!/usr/bin/env python

import re
import sys

re_int = "^[1-9][0-9]*$"
re_string = "^[a-z]*$"

data = []

for line in sys.stdin:
	if line.strip() != "": data.append(line.strip())

n = int(data[0])
assert re.match(re_int, data[0])
assert n <= 10**5	

assert len(data) == n+1	

for i in range(1, n+1):
	assert re.match(re_string, data[i])
	assert len(data[i]) <= 20

sys.exit(42)
