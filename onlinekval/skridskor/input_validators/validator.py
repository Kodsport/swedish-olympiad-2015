import re
import sys

d_r = [0, 1, 0, -1]
d_c = [1, 0, -1, 0]

vis = {}

def dfs(grid, r, c, d):
    if (r,c,d) in vis: return False
    vis[(r,c,d)] = True
    next_sq = None
    while True:
        nr = r + d_r[d]
        nc = c + d_c[d]
        if nc == len(grid[0]) - 1 and grid[nr][nc] == '.':
            return True
        if nc < 0 or nr < 0 or nc >= len(grid[0]) or nr >= len(grid):
            return False
        if grid[nr][nc] != '.': break
        r = nr
        c = nc

    dl = (d + 3) % 4
    dr = (d + 1) % 4

    left = dfs(grid, r, c, dl)
    right = dfs(grid, r, c, dr)

    return left or right

def check_grid(grid):
    assert dfs(grid, 0, 0, 0)


int_regex = "(0|[1-9][0-9]*)"
pair_regex = int_regex + " " + int_regex
first_line_regex = "^" + pair_regex + "$"
map_line_regex = "^[.#]+$"

line = sys.stdin.readline()
assert re.match(first_line_regex, line)
coords = [int(x) for x in line.split()]
assert len(coords) == 2
N,M = coords

assert 3 <= N <= 100 and 3 <= M <= 100

grid = []

hc = 0
for i in range(N):
    line = sys.stdin.readline()
    assert re.match(map_line_regex, line)
    assert len(line.strip()) == M
    grid.append(line.strip())

line = sys.stdin.readline()
assert len(line) == 0

check_grid(grid)

sys.exit(42)
