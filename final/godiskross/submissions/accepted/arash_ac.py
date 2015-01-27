import sys

N = int(sys.stdin.readline())
GODIS = list(sys.stdin.readline().strip())
GODISGODIS = GODIS + GODIS

def crush(godis):
  new_godis = []
  score = 0
  i = 0
  while i < len(godis):
    old_i = i
    end = None
    j = i+1
    for j in range(i+1, len(godis)):
      if i+2 < j:
        end = j
      if godis[j] != godis[i]:
        break
    i = j
    if end:
      score += (end - old_i) * 2 - 5
    else:
      new_godis += godis[old_i:j]

  return (new_godis, score)


def fill_godis(godis, c):
  to_fill = len(GODIS) - len(godis)
  assert to_fill >= 0
  godis = godis + GODISGODIS[c:c+to_fill]
  c = (c+to_fill)%len(GODIS)
  return godis, c

def crush_and_fill(godis, c):
  # print 'godis', godis
  new_godis, score = crush(godis)
  if new_godis == godis:
    # okrossbar
    assert score == 0
    return godis, 0, c
  else:
    # print 'new_godis', new_godis
    # print 'score', score
    new_godis, c = fill_godis(new_godis, c)
    assert score > 0
    new_godis, more_score, c = crush_and_fill(new_godis, c)
    return new_godis, score + more_score, c

def go(N, godis, orig_c):
  if N <= 0:
    return 0

  ress = []
  for i in range(len(godis)-1):
    godis[i], godis[i+1] = godis[i+1], godis[i]
    new_godis, score, new_c = crush_and_fill(godis, orig_c)
    more_score = go(N-1, new_godis, new_c)
    ress.append(score + more_score)
    godis[i], godis[i+1] = godis[i+1], godis[i]

  return max(ress)

print (go(N, GODIS, 0))
