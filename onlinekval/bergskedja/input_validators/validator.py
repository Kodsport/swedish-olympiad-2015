#!/usr/bin/python3
import re
import sys

int_regex = "(0|-?[1-9][0-9]*)"
pair_regex = int_regex + " " + int_regex
first_line_regex = "^" + int_regex + "$"
point_regex = "^" + pair_regex + "$"

line = sys.stdin.readline()
assert re.match(first_line_regex, line)
N = int(line.strip())

assert 1 <= N <= 100000

for i in range(N):
    line = sys.stdin.readline()
    assert re.match(point_regex, line)
    X,Y = map(int, line.split())
    assert -100000 <= X <= 100000
    assert 0 <= Y <= 10000

line = sys.stdin.readline()
assert len(line) == 0

sys.exit(42)
