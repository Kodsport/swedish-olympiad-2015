import sys

line = sys.stdin.readline().strip()
line_out = []

i = 0
while i < len(line):
    c = line[i]
    line_out += c
    i += ord(c) - ord('A') + 1

print(''.join(line_out))
