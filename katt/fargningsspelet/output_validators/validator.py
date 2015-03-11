import sys
import random

[N, case] = map(int, open(sys.argv[1], 'r').read().strip().split())
strategy = int(open(sys.argv[2], 'r').read().strip())
assert 0 <= strategy <= 4
random.seed(N*10 + strategy*2 + case)

our_used = [False] * N
their_used = [False] * N
def mark_used(used, used2, move):
    global case
    used[move] = used2[move] = True
    if not (case == 2 and move == N-1):
        used[(move+1) % N] = True
    if not (case == 2 and move == 0):
        used[(move-1+N) % N] = True

SwitchToRandom = {}
the_move = None
def random_runner():
    perm = list(range(N))
    random.shuffle(perm)
    for i in perm:
        if not our_used[i]:
            yield i
    yield -1

def runner12():
    first = 0 if strategy == 1 else N-1
    second = N-1 if strategy == 1 else 0
    yield first
    if not our_used[second]:
        yield second
    yield SwitchToRandom

def runner3():
    assert N % 2 == 1
    yield N // 2
    while True:
        if our_used[0] or our_used[N-1]:
            # opponent took corner, fail
            yield SwitchToRandom
        if their_used[0] or their_used[N-1]:
            # yes! now we can win
            take = N-1 if their_used[0] else 0
            yield take
            yield N-1-take
            yield SwitchToRandom
        mirror = N-1-the_move
        if not our_used[mirror]:
            yield mirror
        else:
            # can't mirror, because it's near the middle. take the corner and hope
            yield 0
            if not our_used[N-1]:
                yield N-1
            yield SwitchToRandom

def runner4():
    g2 = random_runner()
    while True:
        if our_used[0] or our_used[N-1]:
            # opponent took corner, fail
            yield SwitchToRandom
        if their_used[0] or their_used[N-1]:
            # yes! now we can win
            take = N-1 if their_used[0] else 0
            yield take
            yield N-1-take
            yield SwitchToRandom
        # first take random points not in the middle or near the corners
        for r in g2:
            if 1 < r < N-2 and 2*r+1 != N:
                yield r
                break
        else:
            # when there are none, take the middle if it exists, else a corner
            if N % 2 == 1 and not our_used[N // 2]:
                yield N // 2
            else:
                yield N-1

g = None
if strategy == 0:
    g = random_runner()
elif strategy == 1 or strategy == 2:
    g = runner12()
elif strategy == 3:
    g = runner3()
elif strategy == 4:
    g = runner4()

try:
    print "{} {}".format(N, case)
    while True:
        v = g.next()
        if v == SwitchToRandom:
            g = random_runner()
            v = g.next()
        if v == -1:
            print -1
            sys.stdout.flush()
            exit(42)
        assert not our_used[v]
        mark_used(our_used, their_used, v)
        print (v+1)
        sys.stdout.flush()
        move = int(sys.stdin.readline().strip())-1
        if move < 0 or move >= N or their_used[move]:
            exit(43)
        mark_used(their_used, our_used, move)
        the_move = move
except (EOFError, ValueError):
    exit(43)
