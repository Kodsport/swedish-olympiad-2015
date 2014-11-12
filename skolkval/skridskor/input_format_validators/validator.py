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
        if grid[nr][nc] != '.': break
        r = nr
        c = nc

    dl = (d + 3) % 4
    dr = (d + 1) % 4

    left = dfs(grid, r, c, dl)
    right = dfs(grid, r, c, dr)

    return left or right

def check_grid(grid):
    row = 0
    cnt = 0
    for i in xrange(len(grid)):
        if grid[i][0] == 'S':
            row = i
            cnt += 1

    # one entry square
    assert cnt == 1
    assert dfs(grid, row, 0, 0)


int_regex = "(0|[1-9][0-9]*)"
pair_regex = int_regex + " " + int_regex
first_line_regex = "^" + pair_regex + "$"
map_line_regex = "^[.#S]+$"

line = sys.stdin.readline()
assert re.match(first_line_regex, line)
coords = [int(x) for x in line.split()]
assert len(coords) == 2
N,M = coords

assert 3 <= N <= 15 and 3 <= M <= 15

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
