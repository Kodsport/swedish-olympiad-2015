#!/usr/bin/env python
import sys
import random

coord_max = 1000000

# Everything reachable from everything else.
def gen_convex(n):
    xs = range(1, n+1)
    ys = [1] * n
    for i in range(1, n):
        ys[i] = ys[i-1] + i
    return zip(xs, ys)

# Nothing reachable from anything else.
def gen_concave(n):
    xs, ys = zip(*gen_convex(n))
    ymax = max(ys) + 1
    return zip(xs, [ymax - y for y in ys])

# Like convex, but with deep valleys between every second pair of points.
def gen_many_valleys(n):
    xs = range(1, n+1)
    ys = [coord_max // 2] * n
    for i in range(1, n):
        ys[i] = ys[i-1] + i
    for i in range(1, n-1):
        if i % 3 == 1:
            ys[i] = 0
    return zip(xs, ys)

# Random points in the plane, sorted by x coordinate.
def gen_random(n, maxx, maxy):
    availx = list(range(maxx))
    availy = list(range(maxy))
    xs = random.sample(availx, n)
    ys = [random.choice(availy) for _ in range(n)]
    xs.sort()
    return zip(xs, ys)

# Generate a testcase that has tops with random valleys inbetween. Will always have a possible answer
def gen_random_tops(n, d, maxx, maxy):
    xs = sorted(random.sample(range(maxx), n))
    ys = [0]*n
    tops = sorted([0,n-1] + random.sample(range(1,n-1), random.randint(1, n/4)))
    ys[0] = maxy/2
    for i in range(1,len(tops)):
        dx = xs[tops[i]] - xs[tops[i-1]]
        dy = int(dx*d)
        ys[tops[i]] = random.randint(max(0, ys[tops[i-1]]-dy+1), min(maxy, ys[tops[i-1]]+dy-1))
    ti = 0
    for i in range(n):
        if i in tops:
            ti += 1
        else:
            y = min(ys[tops[ti-1]], ys[tops[ti]])
            ys[i] = random.randint(y/2, y)
    return zip(xs, ys)

# A straight line (all y coordinates the same).
def gen_repeated(n):
    return [(x, 0) for x in range(n)]

def is_possible(n, d, p):
    pos = [False]*n
    pos[0] = True
    for i in range(n):
        if pos[i]:
            highest = -100*d
            for j in range(i+1,n):
                dx = p[j][0] - p[i][0]
                dy = p[j][1] - p[i][1]
                angle = float(dy) / dx
                if abs(angle) <= d and angle >= highest:
                    pos[j] = True
                highest = max(highest, angle)
    return pos[n-1]

def raise_random_point(n, d, p, maxy):
    pi = random.randrange(0,n)
    ny = p[pi][1]
    for i in range(n):
        if i == pi:
            continue
        ny = max(ny, int(1.0002*(p[i][1] + d*(p[pi][0] - p[i][0]) + 1)))
    ny = min(ny, maxy)
    p[pi] = (p[pi][0], ny)

def gen(method, n, d):
    li = method.split(',')
    method = li[0]
    params = li[1:]
    if method == 'convex':
        return gen_convex(n)
    elif method == 'concave':
        return gen_concave(n)
    elif method == 'valleys':
        return gen_many_valleys(n)
    elif method == 'random':
        maxx = int(params[0]) if len(params) > 0 else coord_max
        maxy = int(params[1]) if len(params) > 1 else coord_max
        return gen_random(n, maxx, maxy)
    elif method == 'tops':
        maxx = int(params[0]) if len(params) > 0 else coord_max
        maxy = int(params[1]) if len(params) > 1 else coord_max
        return gen_random_tops(n, d, maxx, maxy)
    elif method == 'tops2':
        maxx = int(params[0]) if len(params) > 0 else coord_max
        maxy = int(params[1]) if len(params) > 1 else coord_max
        points = gen_random_tops(n, d, maxx, maxy)
        while is_possible(n, d, points):
            raise_random_point(n, d, points, maxy)
        return points
    elif method == 'repeated':
        return gen_repeated(n)
    assert False, "invalid method name"

seed = int(sys.argv[1])
method = sys.argv[2]
n = int(sys.argv[3])
d = float(sys.argv[4])

random.seed(seed)

points = gen(method, n, d)
print >> sys.stderr, is_possible(n,d,points)
xlast = -1
print('{} {:.5f}'.format(n, d))
for (x, y) in points:
    assert 0 <= x <= coord_max
    assert 0 <= y <= coord_max
    assert x > xlast
    xlast = x
    print('{} {}'.format(x, y))
