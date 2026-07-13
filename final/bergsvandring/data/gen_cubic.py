#!/usr/bin/python3

# Worst case for the O(n^3) solutions that, for every candidate bridge, rescan
# every intermediate point to check that the bridge clears the mountain.
#
# The body of the mountain is a convex parabola sampled onto a coarse integer
# grid, and d is large enough that *every* chord is within the slope limit, so
# the cubic scan is entered for all C(n,2) pairs and performs the full C(n,3)
# comparisons -- the theoretical maximum.
#
# Convexity is what makes this robust: on a convex chain a chord is never
# blocked by an early intermediate point, so adding an inner-loop `break` buys
# a cubic solution nothing.  Rounding the parabola to integers perturbs the
# convexity just enough that a quarter of the chords are blocked, but always
# late in the scan -- still invisible to a `break`, while defeating PyPy's
# specialisation of an inner loop that accumulates into a bool.
#
# The two outermost segments are made too steep to walk, so the answer is a
# real pair of bridges rather than 0.  d is placed in the middle of a wide gap
# (steepest walkable chord 0.8, end segments 1.6), so the answer does not
# depend on the exact value of d.

import sys

def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    if default is None:
        print("missing parameter", name)
        sys.exit(1)
    return default

n = int(cmdlinearg('n'))
band = int(cmdlinearg('band'))       # height of the convex body; a small band means coarse rounding
dx = int(cmdlinearg('dx', 1000))     # horizontal spacing
rise = int(cmdlinearg('rise', 1600)) # end segments climb `rise` over `dx`, i.e. slope 1.6

d = 0.75 * rise / dx                 # 0.8 < 1.2 < 1.6

c = (n - 1) / 2.0
y = [round(band * ((i - c) / c) ** 2) for i in range(n)]
y[0] = y[1] + rise
y[n - 1] = y[n - 2] + rise

print(n, d)
for i in range(n):
    print(i * dx, y[i])
