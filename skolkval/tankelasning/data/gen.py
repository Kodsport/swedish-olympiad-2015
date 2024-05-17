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



n = int(cmdlinearg("n",random.randint(1,10)))

m = int(cmdlinearg("tot", random.randint(1,10)))

if n == 1:
    m = 1


a = [random.randint(1,n)]

while len(a) < m:
    cand = random.randint(1,n)
    if cand == a[-1]:
        continue
    a.append(cand)


print(n,m)
print(*a)
