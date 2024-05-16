#!/usr/bin/python3
import re
import sys

regex = "^[A-Z]{1,50}$"

line = sys.stdin.readline()
assert re.match(regex, line)

# Kontrollerar att man alltid hamnar på den sista bokstaven.
line = line[:-1] # tar bort newline
ind = 0
while ind < len(line) - 1:
    ind += ord(line[ind]) - ord("A") + 1
    if ind == len(line) - 1:
        break
    assert ind < len(line) - 1 



line = sys.stdin.readline()
assert len(line) == 0

sys.exit(42)
