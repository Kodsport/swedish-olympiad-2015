#!/usr/bin/python3
import sys
import random

def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    assert default is not None, name
    return default

n = int(cmdlinearg("N"))
xmax = int(cmdlinearg("X_MAX"))
xmin = -xmax
ymax = int(cmdlinearg("Y_MAX"))
seed = int(cmdlinearg("seed"))
random.seed(seed)
nholes = int(cmdlinearg("holes"))
ndups = random.randint(0, min(n-1,15))
print(n)
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
    print(x, y)

for i in range(ndups):
    point = p[random.randint(0, n - ndups - 1)]
    print(point[0],point[1])
