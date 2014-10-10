#!/usr/bin/python

import sys

if len(sys.argv) < 4:
    print "Usage: python gen_empty N M [yes|no]"
    exit(0)

N = int(sys.argv[1])
M = int(sys.argv[2])
fixed_answer = sys.argv[3]

print N,M
grid = [['.' for j in range(M)] for i in range(N)]

grid[0][0] = grid[N-1][M-1] = 'H'
if fixed_answer == "no":
    grid[N-2][M-3] = grid[N-3][M-2] = '#'

for line in grid:
    print "".join(line)
