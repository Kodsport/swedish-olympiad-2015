#!/usr/bin/env bash

. ../../testdata_tools/gen.sh

use_solution eo_100.cc

compile gen.py

samplegroup
sample 1
sample 2
sample 3

group g1 20
limits maxN=100 maxAbsX=100 maxY=100
tc 1
tc 2
tc g1_1 gen N=100 X_MAX=100 Y_MAX=100 seed=11 holes=0
tc g1_2 gen N=100 X_MAX=100 Y_MAX=100 seed=21 holes=0
tc g1_3 gen N=100 X_MAX=100 Y_MAX=100 seed=31 holes=0
tc g1_4 gen N=100 X_MAX=100 Y_MAX=100 seed=41 holes=0
tc g1_5 gen N=100 X_MAX=100 Y_MAX=100 seed=51 holes=0
tc g1_6 gen N=100 X_MAX=100 Y_MAX=100 seed=61 holes=1
tc g1_7 gen N=100 X_MAX=100 Y_MAX=100 seed=71 holes=1
tc g1_8 gen N=100 X_MAX=100 Y_MAX=100 seed=81 holes=2

group g2 20
limits maxN=100000 maxAbsX=1000 maxY=1000
include_group g1
tc g2_1 gen N=100000 X_MAX=1000 Y_MAX=1000 seed=12 holes=0
tc g2_2 gen N=100000 X_MAX=1000 Y_MAX=1000 seed=22 holes=0
tc g2_3 gen N=100000 X_MAX=1000 Y_MAX=1000 seed=32 holes=0
tc g2_4 gen N=100000 X_MAX=1000 Y_MAX=1000 seed=42 holes=0
tc g2_5 gen N=100000 X_MAX=1000 Y_MAX=1000 seed=52 holes=1
tc g2_6 gen N=100000 X_MAX=1000 Y_MAX=1000 seed=62 holes=1
tc g2_7 gen N=100000 X_MAX=1000 Y_MAX=1000 seed=72 holes=2
tc g2_8 gen N=100000 X_MAX=1000 Y_MAX=1000 seed=82 holes=2

group g3 60
limits maxN=100000 maxAbsX=100000 maxY=10000
tc 3
include_group g2
tc g3_1 gen N=100000 X_MAX=100000 Y_MAX=10000 seed=13 holes=0
tc g3_2 gen N=100000 X_MAX=100000 Y_MAX=10000 seed=23 holes=0
tc g3_3 gen N=100000 X_MAX=100000 Y_MAX=10000 seed=33 holes=0
tc g3_4 gen N=100000 X_MAX=100000 Y_MAX=10000 seed=43 holes=1
tc g3_5 gen N=100000 X_MAX=100000 Y_MAX=10000 seed=53 holes=1
tc g3_6 gen N=100000 X_MAX=100000 Y_MAX=10000 seed=63 holes=1
tc g3_7 gen N=100000 X_MAX=100000 Y_MAX=10000 seed=73 holes=2
tc g3_8 gen N=100000 X_MAX=100000 Y_MAX=10000 seed=83 holes=5
