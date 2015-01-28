import re
import sys

int_regex = "(0|[1-9][0-9]*)"
intspace_regex = int_regex + "( " + int_regex+")*"
line_regex = "^" + intspace_regex + "$"


line=sys.stdin.readline()
assert re.match("^([.|a-z]*)$",line)
assert 2<=len(line.strip())<=20

line=sys.stdin.readline()
assert re.match(line_regex, line)
assert len(line.split())==1
N=int(line)
assert 1<=N<=13

taken=[]
for i in range(N):
    line=sys.stdin.readline()
    assert re.match("^([a-z]*)$",line)
    for x in line.strip():
        assert not x in taken
        taken.append(x)
        
line = sys.stdin.readline()
assert len(line)==0

sys.exit(42)
