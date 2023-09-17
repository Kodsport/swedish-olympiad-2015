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
max_val = int(cmdlinearg('max_val'))
mode = cmdlinearg('mode')

mandat = []

random_center = randint(6, max_val-7)
    
has_found = False
while (not has_found):
    l = []
    sum = 0
    for i in range(n):
        random_mandat
        if (mode == 'big_spread'):
            random_mandat = random.randint(1, max_val-n+i)
            max_val -= random_mandat;
        elif (mode == 'small_spread'):
            random_mandat = random.randint(random_center-5, random_center+5);
        elif (mode == 'maximize_overflow_governments'):
            if (i < n/2):
                random_mandat = random.randint(1, min(5, max_val))
            else:
                random_mandat = random.randint(1, max_val)
        elif (mode == 'standard'):
            random_mandat = random.randint(1, max_val)
        else:
            assert(false)    
        l.append(random_mandat)
        sum += random_mandat
    if sum <= 1000:
        has_found = True
        mandat = l
        
print(n)
print(" ".join([str(x) for x in mandat]))

