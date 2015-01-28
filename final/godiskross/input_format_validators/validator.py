import re
import sys

int_regex = "(0|[1-9][0-9]*)"
intspace_regex = int_regex + "( " + int_regex+")*"
line_regex = "^" + intspace_regex + "$"

line=sys.stdin.readline()
assert re.match(line_regex, line)
assert len(line.split())==1
N=int(line)
assert 1<=N<=5

line=sys.stdin.readline()
assert re.match("^([ABC]*)$",line)
org=line.strip()
R=len(org)
assert 3<=R<=20
for i in range(2,R):
    assert not (org[i]==org[i-1] and org[i]==org[i-2])

sys.exit(42)
