#!/usr/bin/env bash

PPATH=$(realpath ..)
. ../../../testdata_tools/gen.sh

ulimit -s unlimited

use_solution arvid100.cpp

compile gen_random.py

samplegroup
limits max_n=20 max_v=200
sample_manual 1
sample_manual 2

group group1 20
limits max_n=35 max_v=2

tc g1-1 gen_random n=2 max_val=2 mode='standard'
tc g1-2 gen_random n=3 max_val=2 mode='standard'
tc g1-3 gen_random n=5 max_val=2 mode='standard'
tc g1-4 gen_random n=7 max_val=2 mode='standard'
tc g1-5 gen_random n=11 max_val=2 mode='standard'
tc g1-6 gen_random n=13 max_val=2 mode='standard'
tc g1-7 gen_random n=17 max_val=2 mode='standard'
tc g1-8 gen_random n=19 max_val=2 mode='standard'
tc g1-9 gen_random n=23 max_val=2 mode='standard'
tc g1-10 gen_random n=29 max_val=2 mode='standard'
tc g1-11 gen_random n=31 max_val=2 mode='standard'
tc g1-12 gen_random n=31 max_val=2 mode='standard'
tc g1-13 gen_random n=31 max_val=2 mode='standard'
tc g1-14 gen_random n=31 max_val=2 mode='standard'

group group2 30
limits max_n=15 max_v=1000

tc g2-1 gen_random n=2 max_val=200 mode='standard' 
tc g2-2 gen_random n=3 max_val=300 mode='standard'
tc g2-3 gen_random n=7 max_val=1000 mode='big_spread'
tc g2-4 gen_random n=11 max_val=70 mode='small_spread' 
tc g2-5 gen_random n=13 max_val=200 mode='maximize_overflow_governments' 
tc g2-6 gen_random n=15 max_val=1000 mode='big_spread'
tc g2-7 gen_random n=15 max_val=300 mode='maximize_overflow_governments'
tc g2-8 gen_random n=15 max_val=60 mode='small_spread'
tc g2-9 gen_random n=15 max_val=300 mode='standard' 


include_group group1
include_group group2
group group3 50

tc g3-1 gen_random n=25 max_val=200 mode='standard'
tc g3-2 gen_random n=27 max_val=1000 mode='big_spread'
tc g3-3 gen_random n=24 max_val=30 mode='small_spread'
tc g3-4 gen_random n=31 max_val=200 mode='maximize_overflow_governments' 
tc g3-5 gen_random n=34 max_val=200 mode='standard' 
tc g3-6 gen_random n=35 max_val=200 mode='standard'
tc g3-7 gen_random n=35 max_val=300 mode='standard'
tc g3-8 gen_random n=35 max_val=100 mode='standard'
tc g3-9 gen_random n=35 max_val=500 mode='big_spread'
tc g3-10 gen_random n=31 max_val=900 mode='big_spread' 
tc g3-11 gen_random n=35 max_val=20 mode='small_spread' 
tc g3-12 gen_random n=35 max_val=30 mode='small_spread'  
tc g3-13 gen_random n=35 max_val=150 mode='maximize_overflow_governments' 
tc g3-14 gen_random n=35 max_val=250 mode='maximize_overflow_governments' 