#!/usr/bin/env bash

. ../../testdata_tools/gen.sh

use_solution eo_ac.cc

compile gen_testcase.py
compile gen_empty.py

samplegroup
sample 1
sample 2
sample 3

group g1 40
limits maxNM=100
tc 1
tc 2
tc 3
tc g1_1 gen_testcase N=97 M=99 seed=11 p=0.4 fixed_answer=yes
tc g1_2 gen_testcase N=95 M=94 seed=21 p=0.7 fixed_answer=no
tc g1_3 gen_testcase N=96 M=90 seed=31 p=0.4 fixed_answer=yes
tc g1_4 gen_testcase N=95 M=98 seed=41 p=0.7 fixed_answer=no
tc g1_5 gen_testcase N=100 M=100 seed=51 p=0.7 fixed_answer=yes
tc g1_6 gen_testcase N=100 M=100 seed=61 p=0.7 fixed_answer=no
tc g1_7 gen_testcase N=100 M=100 seed=71 p=0.8 fixed_answer=yes
tc g1_8 gen_testcase N=100 M=100 seed=81 p=0.9 fixed_answer=no
tc g1_9 gen_empty N=100 M=100 fixed_answer=yes
tc g1_10 gen_empty N=100 M=100 fixed_answer=no

group g2 60
limits maxNM=500
include_group g1
tc g2_1 gen_testcase N=497 M=499 seed=12 p=0.4 fixed_answer=yes
tc g2_2 gen_testcase N=495 M=494 seed=22 p=0.75 fixed_answer=no
tc g2_3 gen_testcase N=496 M=490 seed=32 p=0.4 fixed_answer=yes
tc g2_4 gen_testcase N=495 M=498 seed=42 p=0.75 fixed_answer=no
tc g2_5 gen_testcase N=500 M=500 seed=52 p=0.7 fixed_answer=yes
tc g2_6 gen_testcase N=500 M=500 seed=62 p=0.75 fixed_answer=no
tc g2_7 gen_testcase N=500 M=500 seed=72 p=0.75 fixed_answer=yes
tc g2_8 gen_testcase N=500 M=500 seed=82 p=0.9 fixed_answer=no
tc g2_9 gen_empty N=500 M=500 fixed_answer=yes
tc g2_10 gen_empty N=500 M=500 fixed_answer=no
