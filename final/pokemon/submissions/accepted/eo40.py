import sys

N,M = map(int,sys.stdin.readline().split())
down = [[] for i in range(N)]
cut = [0.0]*N
cut[0] = 1.0
for i in range(M):
  a,b = map(lambda s: int(s)-1, sys.stdin.readline().split())
  down[a].append(b)

q = []
q.append(0)
while q:
  v = q.pop()
  for u in down[v]:
    if not cut[u]:
      cut[u] = cut[v]/2
      q.append(u)

res = 0
for i in range(N):
  res += 100*cut[i]
print res
