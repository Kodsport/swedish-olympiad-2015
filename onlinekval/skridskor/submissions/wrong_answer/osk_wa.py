import re
import sys

d_r = [0, 1, 0, -1]
d_c = [1, 0, -1, 0]

vis = {}

def dfs(grid, r, c, d):
    if (r,c,d) in vis: return 10**9
    vis[(r,c,d)] = True
    next_sq = None
    while True:
        nr = r + d_r[d]
        nc = c + d_c[d]
        if nc == len(grid[0]) - 1 and grid[nr][nc] == '.':
            return 0
        if nc < 0 or nr < 0 or nc >= len(grid[0]) or nr >= len(grid):
            return 10**9
        if grid[nr][nc] != '.': break
        r = nr
        c = nc

    dl = (d + 3) % 4
    dr = (d + 1) % 4

    left = dfs(grid, r, c, dl)
    right = dfs(grid, r, c, dr)

    return 1 + min(left,right)

grid = []

R, C = list(map(int, sys.stdin.readline().split()))
for i in range(R):
    line = sys.stdin.readline().strip()
    grid.append(line)

print(dfs(grid,0,0,0))
