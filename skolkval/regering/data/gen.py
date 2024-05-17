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



n = int(cmdlinearg("n",random.randint(2,35)))

tot = int(cmdlinearg("tot", random.randint(n,1000)))


a = [1]*n
tot -= n

for _ in range(tot):
    a[random.randint(0,n-1)] += 1

print(n)
print(*a)

