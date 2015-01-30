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

print N,M

if N < 500:
  possible_edges = []
  for a in range(1,N+1):
    for b in range(a+1,N+1):
      possible_edges.append((a,b))
  edges = random.sample(possible_edges, M)
  for e in edges:
    print e[0],e[1]
else:
  m = 0
  used = {}
  while m < M:
    e = random.randrange(0,N*N)
    edge = tuple(sorted((e%N,e/N)))
    if edge[0] != edge[1] and not edge in used:
      m += 1
      used[edge] = True
      print edge[0]+1,edge[1]+1
