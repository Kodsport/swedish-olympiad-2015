import re
import sys

int_regex = "(0|[1-9][0-9]*)"
op_regex = "(\+|\-|\*)"
expression_regex = int_regex + "(" + op_regex+int_regex+")*"
line_regex = "^" + expression_regex + "$"


line=sys.stdin.readline()
assert re.match(line_regex,line)
assert len(line.strip())<=100
terms=[int(x) for x in line.replace('+','*').replace('-','*').split('*')]
for t in terms:
   assert 0<=t<1000000
line = sys.stdin.readline()
assert len(line)==0

sys.exit(42)
