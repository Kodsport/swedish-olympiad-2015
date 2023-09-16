#!/usr/bin/python3

import sys
import random
import math

def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    if default is None:
        print("missing parameter", name)
        exit(1)
    return default

random.seed(int(cmdlinearg('seed', sys.argv[-1])))
n = int(cmdlinearg('n'))
mode = int(cmdlinearg('mode'))

mandat = []

max_val = 200

if mode == 2:
    max_val = 2

has_found = False
while (not has_found):
    l = []
    sum = 0
    for i in range(n):
        random_mandat = random.randint(1, max_val)
        l.append(random_mandat)
        sum += random_mandat
    if sum <= 1000:
        has_found = True
        mandat = l
        
print(n)
print(" ".join([str(x) for x in mandat]))

