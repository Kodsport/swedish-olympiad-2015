import sys
from collections import deque

dr = [-2,-2,-1,-1,1,1,2,2]
dc = [-1,1,-2,2,-2,2,-1,1]

def solve(N, M, grid):
    hPos = [[0,0],[0,0]]
    hi = 0
    q = deque()
    for i in range(N):
        for j in range(M):
            if grid[i][j] == 'H':
                hPos[hi] = [i,j]
                hi += 1
    vis = [[False for _ in range(M)] for _ in range(N)]
    q.append(hPos[0][0]*N+hPos[0][1])
    vis[hPos[0][0]][hPos[0][1]] = True
    while q:
        p = q.pop()
        r = p/N
        c = p%N
        for i in range(8):
            nr = r + dr[i]
            nc = c + dc[i]
            if nr >= 0 and nr < N and nc >= 0 and nc < M and grid[nr][nc] != '#' and not vis[nr][nc]:
                vis[nr][nc] = True
                q.append(nr*N + nc)
    return vis[hPos[1][0]][hPos[1][1]]

if __name__ == '__main__':
    N,M = map(int, sys.stdin.readline().split())
    grid = [[c for c in line.strip()] for line in sys.stdin.readlines()]
    print "JA" if solve(N, M, grid) else "NEJ"
