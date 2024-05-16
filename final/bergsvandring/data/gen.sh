#!/bin/bash

PPATH=$(realpath ..)
. ../../../testdata_tools/gen.sh

ulimit -s unlimited

use_solution simon100.cc

compile gen_testcase.py

samplegroup
limits maxn=20
sample sample1
sample sample2
sample sample3
sample sample4

group group1 40
limits maxn=100
include_group sample
tc g1-1 gen_testcase 13 convex 100 99.1
tc g1-2 gen_testcase 23 convex 100 48.3
tc g1-3 gen_testcase 33 convex 100 52.1
tc g1-4 gen_testcase 63 concave 100 98
tc g1-5 gen_testcase 73 valleys 98 98
tc g1-6 gen_testcase 83 valleys 100 100
tc g1-7 gen_testcase 93 random,100000,4000 100 1.3
tc g1-8 gen_testcase 14 tops 100 53
tc g1-9 gen_testcase 24 tops2 100 18
tc g1-10 gen_testcase 54 repeated 100 0.54

group group2 60
limits maxn=1000
include_group group1
tc g2-1 gen_testcase 11 convex 1000 999.1
tc g2-2 gen_testcase 21 convex 1000 998.8
tc g2-3 gen_testcase 31 convex 1000 499.95
tc g2-4 gen_testcase 41 convex 1000 500.1
tc g2-5 gen_testcase 51 concave 1000 1000
tc g2-6 gen_testcase 61 concave 1000 998
tc g2-7 gen_testcase 71 valleys 998 998
tc g2-8 gen_testcase 81 valleys 1000 789
tc g2-9 gen_testcase 91 random,100000,1000 1000 50
tc g2-10 gen_testcase 12 random,100000,4000 1000 12.54
tc g2-11 gen_testcase 22 tops 1000 897.25
tc g2-12 gen_testcase 32 tops2 1000 22.3
tc g2-13 gen_testcase 42 tops 996 897.25
tc g2-14 gen_testcase 52 tops 989 0.543
tc g2-15 gen_testcase 62 repeated 1000 0.2

