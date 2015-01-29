#!/usr/bin/python

import sys
import random
import math

if len(sys.argv) < 4:
    print "Usage: python gen_random N M seed"
    exit(0)

def get_edge(index):
    lo = int(math.sqrt(index)) + 2
    while (lo + 2)*(lo + 1)//2 > index:
        lo -= 1
    while lo*(lo + 1)//2 < index:
        lo += 1

    hi = index - lo*(lo - 1)//2
    return (hi, lo + 1)

N = int(sys.argv[1])
M = int(sys.argv[2])
seed = int(sys.argv[3])
random.seed(seed)

possible_edges = N * (N - 1) // 2 - N

print("%d %d" % (N, M))

edges = random.sample(range(1, possible_edges + 1), M)
for edge in edges:
    a, b = get_edge(edge)
    print("%d %d" % (a + 1, b + 1))
