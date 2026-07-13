import heapq
import sys

l = sys.stdin.read().split()
if l:
    n = int(l[0])
    d = float(l[1])
    p = []
    idx = 2
    for _ in range(n):
        p.append((int(l[idx]), int(l[idx+1])))
        idx += 2

    g = [[] for _ in range(n)]
    for i in range(n):
        x1, y1 = p[i]
        if i < n - 1:
            x2, y2 = p[i+1]
            s = abs(y2 - y1) / (x2 - x1)
            if s <= d:
                g[i].append((i+1, 0.0))
                g[i+1].append((i, 0.0))
        m = -float('inf')
        for j in range(i + 1, n):
            x2, y2 = p[j]
            s = (y2 - y1) / (x2 - x1)
            if j > i + 1:
                if s >= m and abs(s) <= d:
                    dst = ((x2 - x1)**2 + (y2 - y1)**2)**0.5
                    g[i].append((j, dst))
                    g[j].append((i, dst))
            m = max(m, s)

    dsts = [float('inf')] * n
    dsts[0] = 0.0
    pq = [(0.0, 0)]
    while pq:
        d_u, u = heapq.heappop(pq)
        if d_u > dsts[u]:
            continue
        if u == n - 1:
            break
        for v, w in g[u]:
            if dsts[u] + w < dsts[v]:
                dsts[v] = dsts[u] + w
                heapq.heappush(pq, (dsts[v], v))

    ans = dsts[n-1]
    if ans == float('inf'):
        print(-1)
    else:
        print(f"{ans:.5f}")
