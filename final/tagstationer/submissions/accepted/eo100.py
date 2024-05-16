#!/usr/bin/python3
import sys

N = int(sys.stdin.readline())
plus = []
minus = []
for i in range(N):
  on,off = list(map(int, sys.stdin.readline().split()))
  if off < on:
    plus.append((off,on,i+1))
  else:
    minus.append((on,off,i+1))

plus = sorted(plus)
minus = sorted(minus, reverse=True)

good = True
curr = 0
order = []
for train in plus:
  if train[0] > curr:
    good = False
  curr -= train[0]
  curr += train[1]
  order.append(train[2])

for train in minus:
  if train[1] > curr:
    good = False
  curr -= train[1]
  curr += train[0]
  order.append(train[2])

good = good and curr == 0
if good:
  print("JA")
  print(" ".join(map(str,order)))
else:
  print("NEJ")
