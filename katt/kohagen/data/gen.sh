#!/usr/bin/env bash

PPATH=$(realpath ..)
. ../../../testdata_tools/gen.sh


use_solution simon_ac.cpp

compile generator_manual.py
compile generator_random.py
compile generator_regular.py
compile generator_max.cpp

samplegroup
sample sample1
sample sample2
sample sample3

group g1 23
include_group sample
tc g1-1 generator_random 4 50 10 1000
tc g1-2 generator_random 4 50 10 1000
tc g1-3 generator_random 4 50 10 1000
tc g1-4 generator_random 4 50 10 1000
tc g1-5 generator_random 4 50 10 1000
tc g1-6 generator_manual 50 1000 1


group g2 21
tc g2-1 generator_regular 4 200 10 1000
tc g2-2 generator_regular 4 200 10 1000
tc g2-3 generator_regular 4 200 10 1000
tc g2-4 generator_regular 4 200 10 1000
tc g2-5 generator_regular 4 200 10 1000
tc g2-6 generator_regular 200 200 900 1000


group g3 34
tc g3-1 generator_max 142 513 360
tc g3-2 generator_max 160 914 360
tc g3-3 generator_max 74 755 360
tc g3-4 generator_max 200 999 360
tc g3-5 generator_max 200 1000 360
tc g3-6 generator_max 200 1000 360
tc g3-7 generator_max 200 1000 270
tc g3-8 generator_max 200 1000 270
tc g3-9 generator_max 200 1000 180
tc g3-10 generator_max 200 1000 90

group g4 13
include_group g1
include_group g2
include_group g3
tc g4-1 generator_random 100 200 10 1000
tc g4-2 generator_random 100 200 10 1000
tc g4-3 generator_random 100 200 10 1000
tc g4-4 generator_random 100 200 10 1000
tc g4-5 generator_random 100 200 10 1000
tc g4-6 generator_manual 200 1000 1
tc g4-7 generator_random 200 200 900 1000


group g5 9
include_group g4
tc g5-1 generator_random 300 400 10 1000
tc g5-2 generator_random 300 400 10 1000
tc g5-3 generator_random 300 400 10 1000
tc g5-4 generator_random 300 400 10 1000
tc g5-5 generator_random 300 400 10 1000
tc g5-6 generator_manual 400 1000 1
tc g5-7 generator_random 400 400 10 1000
tc g5-8 generator_random 400 400 10 1000
tc g5-9 generator_random 400 400 10 1000
tc g5-10 generator_random 400 400 10 1000
tc g5-11 generator_max 400 1000 270
tc g5-12 generator_max 400 1000 270
