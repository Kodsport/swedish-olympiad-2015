#!/usr/bin/python3
import sys

def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    assert default is not None, name
    return default

if len(sys.argv) < 4:
    print("Usage: python gen_empty N M [yes|no]")
    exit(0)

N = int(cmdlinearg("N"))
M = int(cmdlinearg("M"))
fixed_answer = cmdlinearg("fixed_answer")

print(N,M)
grid = [['.' for j in range(M)] for i in range(N)]

grid[0][0] = grid[N-1][M-1] = 'H'
if fixed_answer == "no":
    grid[N-2][M-3] = grid[N-3][M-2] = '#'

for line in grid:
    print("".join(line))
