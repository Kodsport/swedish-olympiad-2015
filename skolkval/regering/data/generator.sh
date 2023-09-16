#!/usr/bin/env bash

PPATH=$(realpath ..)
. ../../../testdata_tools/gen.sh

ulimit -s unlimited

use_solution arvid100.cpp

compile gen_random.py

samplegroup
limits max_n=20
sample_manual 1
sample_manual 2

group group1 20
limits max_n=35

tc g1-1 gen_random n=2 mode=2 seed=12525
tc g1-2 gen_random n=3 mode=2 seed=919
tc g1-3 gen_random n=5 mode=2 seed=1241
tc g1-4 gen_random n=7 mode=2 seed=1411
tc g1-5 gen_random n=11 mode=2 seed=14189
tc g1-6 gen_random n=13 mode=2 seed=2495
tc g1-7 gen_random n=17 mode=2 seed=48252
tc g1-8 gen_random n=19 mode=2 seed=2488
tc g1-9 gen_random n=23 mode=2 seed=9492
tc g1-10 gen_random n=29 mode=2 seed=9199
tc g1-11 gen_random n=31 mode=2 seed=183253
tc g1-12 gen_random n=31 mode=2 seed=183353
tc g1-13 gen_random n=31 mode=2 seed=183153
tc g1-14 gen_random n=31 mode=2 seed=183733


group group2 30
limits max_n=15 

tc g2-1 gen_random n=2 mode=1 seed=1837511
tc g2-2 gen_random n=3 mode=1 seed=1753
tc g2-3 gen_random n=7 mode=1 seed=1941
tc g2-4 gen_random n=11 mode=1 seed=9919
tc g2-5 gen_random n=13 mode=1 seed=9512
tc g2-6 gen_random n=15 mode=1 seed=9199
tc g2-7 gen_random n=15 mode=1 seed=19411
tc g2-8 gen_random n=15 mode=1 seed=2581
tc g2-9 gen_random n=15 mode=1 seed=15211

group group3 50
limits max_n=35 

tc g3-1 gen_random n=2 mode=1 seed=1
tc g3-2 gen_random n=3 mode=1 seed=2
tc g3-3 gen_random n=7 mode=1 seed=13
tc g3-4 gen_random n=11 mode=1 seed=89
tc g3-5 gen_random n=13 mode=1 seed=233
tc g3-6 gen_random n=17 mode=1 seed=91
tc g3-7 gen_random n=19 mode=1 seed=246
tc g3-8 gen_random n=23 mode=1 seed=579
tc g3-9 gen_random n=29 mode=1 seed=670
tc g3-10 gen_random n=31 mode=1 seed=916
tc g3-11 gen_random n=35 mode=1 seed=1586
tc g3-12 gen_random n=35 mode=1 seed=2256
tc g3-13 gen_random n=35 mode=1 seed=3178
tc g3-14 gen_random n=35 mode=1 seed=123421562


