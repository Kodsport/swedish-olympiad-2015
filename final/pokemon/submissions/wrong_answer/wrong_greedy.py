import sys

N,M = map(int,sys.stdin.readline().split())
matches = [[] for i in range(N)]
money = [100.0 for i in range(N)]
for i in range(M):
  a,b = map(lambda s: int(s)-1, sys.stdin.readline().split())
  if a == 0:
    matches[b] = [a] + matches[b]
  else:
    matches[b].append(a)

p = N-1
while p > 0:
  for p2 in matches[p]:
    money[p] /= 2
    money[p2] += money[p]
  p -= 1

print money[0]
