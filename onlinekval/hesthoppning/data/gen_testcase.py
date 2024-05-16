#!/usr/bin/python3

import sys
import random

dr = [-2,-2,-1,-1,1,1,2,2]
dc = [-1,1,-2,2,-2,2,-1,1]

def get_hpos(N, M, grid):
    hPos = [[0,0],[0,0]]
    hi = 0
    for i in range(N):
        for j in range(M):
            if grid[i][j] == 'H':
                hPos[hi] = [i,j]
                hi += 1
    return hPos

def solve(N, M, grid):
    hPos = get_hpos(N, M, grid)
    q = []
    vis = [[False for _ in range(M)] for _ in range(N)]
    q.append(hPos[0])
    vis[hPos[0][0]][hPos[0][1]] = True
    while q:
        r,c = q.pop()
        for i in range(8):
            nr = r + dr[i]
            nc = c + dc[i]
            if nr >= 0 and nr < N and nc >= 0 and nc < M and grid[nr][nc] != '#' and not vis[nr][nc]:
                vis[nr][nc] = True
                q.append([nr,nc])
    return vis[hPos[1][0]][hPos[1][1]]

def generate_board(N, M, p):
    return [['#' if random.random() < p else '.' for _ in range(M)] for _ in range(N)]

def put_horse(N, M, grid):
    while True:
        r = random.randrange(0, N)
        c = random.randrange(0, M)
        if grid[r][c] != 'H':
            grid[r][c] = 'H'
            break

def put_block(N, M, grid):
    while True:
        r = random.randrange(0, N)
        c = random.randrange(0, M)
        if grid[r][c] == '.':
            grid[r][c] = '#'
            break

def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    assert default is not None, name
    return default

if len(sys.argv) < 4:
    print("Usage: python gen_random N M seed [p] [yes|no]")
    exit(0)

N = int(cmdlinearg("N"))
M = int(cmdlinearg("M"))
seed = int(cmdlinearg("seed"))
random.seed(seed)
p = float(cmdlinearg("p", 0.5))
fixed_answer = cmdlinearg("fixed_answer", False)

print(N,M)
grid = generate_board(N, M, p)

put_horse(N, M, grid)
put_horse(N, M, grid)

if fixed_answer:
    if fixed_answer == "yes":
        for i in range(100):
            if not solve(N, M, grid):
                grid = generate_board(N, M, p)
                put_horse(N, M, grid)
                put_horse(N, M, grid)
            else:
                break
    elif fixed_answer == "no":
        hPos = get_hpos(N, M, grid)
        dx = abs(hPos[0][0] - hPos[1][0])
        dy = abs(hPos[0][1] - hPos[1][1])
        if not (dy == 2 and dx == 1 or dy == 1 and dx == 2):
            while solve(N, M, grid):
                put_block(N, M, grid)

for line in grid:
    print("".join(line))
