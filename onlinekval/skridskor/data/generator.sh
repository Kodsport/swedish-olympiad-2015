#!/usr/bin/env bash

. ../../testdata_tools/gen.sh

use_solution osk_ac.cc

compile gen.cc

samplegroup
sample 1
sample 2
sample 3

group g1 40
limits maxRC=15
include_group sample
tc g1_1 gen 3 10 10 5
tc g1_2 gen 10 10 15 6
tc g1_3 gen 3 15 40 7
tc g1_4 gen 15 15 400 8
tc g1_5 gen 15 15 200 9
tc g1_6 gen 15 15 112 10
tc g1_7 gen 15 15 112 11

group g2 30
limits maxRC=30
include_group g1
tc g2_1 gen 3 50 500 11
tc g2_2 gen 50 50 700 50
tc g2_3 gen 50 50 700 1337
tc g2_4 gen 50 50 1100 13
tc g2_5 gen 50 50 620 14145
tc g2_6 gen 50 50 1250 14146

group g3 30
limits maxRC=100
include_group g2
tc g3_1 gen 100 100 10000 31
tc g3_2 gen 100 100 1500 32
tc g3_3 gen 3 100 400 33
tc g3_4 gen 50 100 2500 34
tc g3_5 gen 100 100 10000 35
tc g3_6 gen 100 100 100 36
tc g3_7 gen 100 100 5000 3259
tc g3_8 gen 100 100 5000 420