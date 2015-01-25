#/usr/bin/env python

import sys
data = []

for line in sys.stdin:
    if line.strip() != "": data.append(line.strip())

N, R = map(int, data[0].split())
l = []

for i in range(1, R+1):
    c, r = map(int, data[i].split())
    l += r*[c]

# l = sorted(l) # comment out for WA

print(sum(l[0:N]) + 1)
