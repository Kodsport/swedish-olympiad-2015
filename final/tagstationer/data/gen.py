#!/usr/bin/env python3
import sys
import random

def reduce_to_single_exit(seq):
    exits = 0
    ret = []
    for (a, b) in seq:
        if b >= a:
            exits += b - a
        else:
            ret.append((a, b))
    ret.append((0, exits))
    return ret

# The obvious instance with a unique solution
def gen_seq_1(n):
    m = m // 2
    return [(x, x+1) for x in range(m)] + [(x+1, x) for x in range(m)]

# Like the above, but non-unique in a non-trivial manner because
# a increasing and a decreasing part can be swapped in middle
def gen_seq_2(n):
    m = m // 2
    ret = [(x, x+1) for x in range(m)] + [(x+1, x) for x in range(m)]
    ret[m-2][1] += 1
    ret[m+1][0] += 1
    return ret

# Like the above, but without solution
def gen_seq_3(n):
    m = m // 2
    ret = [(x, x+1) for x in range(m)] + [(x+1, x) for x in range(m)]
    ret[m-1][0] += 1
    ret[m+0][1] += 1
    return ret

# Random, solvable instance
def gen_random(n):
    cur = 0
    ret = []
    for _ in range(n-1):
        dec = random.randrange(cur+1)
        incr = random.randrange(1, 1000)
        cur += incr - dec
        ret.append((incr, dec))
    ret.append((0, cur))
    return ret

def gen(method, n):
    li = method.split(',')
    method = li[0]
    params = li[1:]
    red = False
    if params and params[0] == 'e':
        red = True
        params = params[1:]
    if method == 'seq1':
        ret = gen_seq_1(n)
    elif method == 'seq2':
        ret = gen_seq_2(n)
    elif method == 'seq3':
        ret = gen_seq_3(n)
    elif method == 'random':
        ret = gen_random(n)
    else:
        assert False, "invalid method name"
    if red:
        ret = reduce_to_single_exit(ret)
    return ret

seed = sys.argv[1]
method = sys.argv[2]
n = int(sys.argv[3])

random.seed(seed)

seq = gen(method, n)
random.shuffle(seq)

print('{}'.format(n))
tot = 0
people = 0
for (x, y) in points:
    people += x
    tot += x - y
    print('{} {}'.format(x, y))
assert tot == 0
assert people <= 1e9
