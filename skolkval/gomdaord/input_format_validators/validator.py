import re
import sys

regex = "^[A-Z]{1,50}$"

line = sys.stdin.readline()
assert re.match(regex, line)

line = sys.stdin.readline()
assert len(line) == 0

sys.exit(42)
