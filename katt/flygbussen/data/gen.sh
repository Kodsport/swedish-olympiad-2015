#!/usr/bin/env bash

PPATH=$(realpath ..)
. ../../../testdata_tools/gen.sh

ulimit -s unlimited

use_solution joshua.cpp

compile gen.py

samplegroup
limits maxn=10 maxk=10
sample 1
sample 2
sample 3

# max_n, k, min_n, max_t, max_group_size, max_duplicate

# Resulting n will be around min_n * (max_duplicate/2 + 1).
# max_t should be around 10*k*min_n/max_group_size or rather less.

# N, K <= 15
group g1 13
limits maxn=15 maxk=15
include_group sample
tc g1-1 gen 15 5 4 61 4
tc g1-2 gen 15 2 13 30 2
tc g1-3 gen 15 15 4 100 2
tc_manual large_time.txt

# N <= 100000, K = 1
group g2 18
limits maxn=100000 maxk=1
tc g2-1 gen 100000 1 99000 10000000 3
tc g2-2 gen 100000 1 18000 10000000 2
tc g2-3 gen 100000 1 70000 50000 3

# N, K <= 100
group g3 19
limits maxn=100 maxk=100
include_group g1
tc g3-1 gen 100 97 76 10000 10
tc g3-2 gen 100 84 90 1000 10
tc g3-3 gen 100 19 64 10000 10
 

# N <= 1000, K <= 100
group g4 23
limits maxn=1000 maxk=100
include_group g3
tc g4-1 gen 1000 55 100 100000 60
tc g4-2 gen 1000 99 500 10000 60
tc g4-3 gen 1000 98 979 100000 40
tc g4-4 gen 1000 98 979 5000 40

# N <= 100000, K <= 100
group g5 27
limits maxn=100000 maxk=100
include_group g4
tc g5-1 gen 100000 1 70000 50000 3
tc g5-2 gen 100000 100 5500 100000 60
tc g5-3 gen 100000 100 27000 1000000 60
tc g5-4 gen 100000 98 30001 10000 40
tc g5-5 gen 100000 98 30000 1000000 40
tc g5-6 gen 100000 98 98000 1000000 40
