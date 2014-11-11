#!/bin/sh

# Seven groups:
# 1: N <= 1000, Q <= 1000, guaranteed path (10 points)
# 2: N <= 1000, Q <= 1000 (20 points)
# 3: N <= 5000, Q <= 100000, guaranteed path (10 points)
# 4: N <= 5000, Q <= 100000 (10 points)
# 5: N <= 100000, Q <= 100000, guaranteed path, nicer cases (10 points)
# 6: N <= 100000, Q <= 100000, guaranteed path (30 points)
# 7: N <= 100000, Q <= 100000 (10 points)

OUT=data/secret
rm -rf $OUT
mkdir -p $OUT
pypy gen.py 1000   1000   random  50 0  >$OUT/1a-1234567.in
pypy gen.py 1000   1000   random  0 1   >$OUT/2a-247.in
pypy gen.py 5000   100000 random  100 2 >$OUT/3a-34567.in # (sorry)
pypy gen.py 5000   100000 random  0 3   >$OUT/4a-47.in
pypy gen.py 100000 100000 random  300 4 >$OUT/5a-567.in # (even more sorry...)
pypy gen.py 100000 100000 random  0 5   >$OUT/7a-7.in

pypy gen.py 1000   1000   path    3 6   >$OUT/1b-1234567.in
pypy gen.py 5000   100000 path    3 7   >$OUT/3b-34567.in
pypy gen.py 100000 100000 path    3 8   >$OUT/5b-567.in

pypy gen.py 1000   1000   reverse 3 9   >$OUT/1c-1234567.in
pypy gen.py 5000   100000 reverse 3 10  >$OUT/3c-34567.in
pypy gen.py 100000 100000 reverse 3 11  >$OUT/5c-67.in

pypy gen.py 1000   1000   cycle   3 12  >$OUT/1d-1234567.in
pypy gen.py 5000   100000 cycle   3 13  >$OUT/3d-34567.in
pypy gen.py 100000 100000 cycle   3 14  >$OUT/5d-67.in
