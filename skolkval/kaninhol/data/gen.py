#!/usr/bin/env python3

import sys
import random

def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    assert default is not None, name
    return default


random.seed(int(cmdlinearg('seed', sys.argv[-1])))




n = int(cmdlinearg("n",random.randint(1,9)))

# Holes 1, 2, and 3
h1 = int(cmdlinearg("h1",random.randint(1,9)))
h2 = int(cmdlinearg("h2",random.randint(1,9)))
h3 = int(cmdlinearg("h3",random.randint(1,9)))

order = [*range(1,n+1)][::-1]

def simulate(order, hole):
    inHole = order[-hole:]

    return inHole[::-1] + order[:-hole]

order = simulate(order, h1)
order = simulate(order, h2)
order = simulate(order, h3)

print(n)
print(*order)
