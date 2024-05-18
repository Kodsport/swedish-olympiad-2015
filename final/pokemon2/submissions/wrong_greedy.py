import sys

N,M = map(int,sys.stdin.readline().split())
matches = []
money = [100.0 for i in range(N)]
for i in range(M):
  a,b = map(lambda s: int(s)-1, sys.stdin.readline().split())
  if a == 0:
    matches.append(b)
  else:
    money[b] /= 2
    money[a] += money[b]

for m in matches:
  money[m] /= 2
  money[0] += money[m]

print money[0]
