import sys

N,M = map(int,sys.stdin.readline().split())
up = [[] for i in range(N)]
down = [[] for i in range(N)]
deg = [0]*N
cut = [0.0]*N
cut[0] = 1.0
for i in range(M):
  a,b = map(lambda s: int(s)-1, sys.stdin.readline().split())
  down[a].append(b)
  up[b].append(a)
  deg[b] += 1

q = []
for i in range(N):
  if deg[i] == 0:
    q.append(i)
while q:
  v = q.pop(0)
  up[v].sort(key=lambda a: cut[a], reverse=True)
  p = 0.5
  for u in up[v]:
    cut[v] += p*cut[u]
    p /= 2
  for u in down[v]:
    deg[u] -= 1
    if deg[u] == 0:
      q.append(u)

res = 0
for i in range(N):
  res += 100*cut[i]
print res
