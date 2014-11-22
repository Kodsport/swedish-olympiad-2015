#!/usr/bin/python
import sys
import random

if len(sys.argv) != 6:
    print "Usage: python gen_testcase.py N X_MAX Y_MAX seed holes"
    exit()

n = int(sys.argv[1])
xmax = int(sys.argv[2])
xmin = -xmax
ymax = int(sys.argv[3])
seed = int(sys.argv[4])
random.seed(seed)
nholes = int(sys.argv[5])
ndups = random.randint(0, min(n-1,15))
print n
holes = []
for i in range(nholes):
    holes.append(random.randint(xmin, xmax))

p = []
for i in range(n - ndups):
    x = random.randint(xmin, xmax)
    y = random.randint(0, ymax)
    for h in holes:
        d = abs(x - h)
        y = min(d - 1, y)
        y = max(0, y)
    p.append([x,y])
    print x, y

for i in range(ndups):
    point = p[random.randint(0, n - ndups - 1)]
    print point[0],point[1]
