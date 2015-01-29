#!/usr/bin/python

import sys
import random
import math

if len(sys.argv) < 4:
    print "Usage: python gen_random N M seed"
    exit(0)

N = int(sys.argv[1])
M = int(sys.argv[2])
seed = int(sys.argv[3])
random.seed(seed)
print("%d %d" % (N, M))

edges = random.sample(range(2, N+1), M)
for edge in edges:
    assert edge > 1
    print("%d %d" % (random.choice(xrange(1, edge)), edge))
