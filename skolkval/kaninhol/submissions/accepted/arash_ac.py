#!/usr/bin/python3
import sys
import itertools

line = sys.stdin.readline().strip()
n = int(line)
line = sys.stdin.readline().strip()
end_position = [*map(int, line.split())]

start_position = [*range(n, 0, -1)]

def enter_hole(xs, hole_size):
  r = xs[0:-hole_size]
  l = list(reversed(xs[-hole_size:]))
  #print(l,r)
  return l + r

perms = itertools.product(range(1, n), repeat=3)
for hss in perms:
  position = start_position
  for hs in hss:
    position = enter_hole(position, hs)
  if position == end_position:
    print("%s %s %s" % hss)
