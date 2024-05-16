#!/usr/bin/python3
import re
import sys

int_regex = "(0|[1-9][0-9]*)"
pair_regex = int_regex + " " + int_regex
first_line_regex = "^" + pair_regex + "$"
map_line_regex = "^[.H#]+$"

line = sys.stdin.readline()
assert re.match(first_line_regex, line)
coords = [int(x) for x in line.split()]
assert len(coords) == 2
N,M = coords

assert 1 <= N <= 500 and 1 <= M <= 500

hc = 0
for i in range(N):
    line = sys.stdin.readline()
    assert re.match(map_line_regex, line)
    assert len(line.strip()) == M
    for j in range(M):
        if line[j] == 'H':
            hc += 1

assert hc == 2

line = sys.stdin.readline()
assert len(line) == 0

sys.exit(42)
