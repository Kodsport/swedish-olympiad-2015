#!/usr/bin/env bash

. ../../testdata_tools/gen.sh

use_solution kentbuggen_js.cpp

compile gen.cpp

samplegroup
sample 1
sample 2

group g1 50
limits maxn=1000
tc 1
tc 2
tc g1_10_1 gen 10 1 41241 
tc g1_10_3 gen 10 3 41242 
tc g1_10_8 gen 10 8 41243 
tc g1_10_10 gen 10 10 41244 
tc g1_1000_1 gen 1000 1 41245 
tc g1_1000_10 gen 1000 10 41246 
tc g1_1000_300 gen 1000 300 41247 
tc g1_1000_800 gen 1000 800 42148 
tc g1_1000_1000 gen 1000 1000 41249 

group g2 50
limits maxn=100000
include_group g1
tc g2_100000_1 gen 100000 1 412410 
tc g2_100000_1000 gen 100000 1000 412411 
tc g2_100000_10000 gen 100000 10000 412412 
tc g2_100000_30000 gen 100000 30000 412413 
tc g2_100000_80000 gen 100000 80000 412414 
tc g2_100000_100000 gen 100000 100000 421415 
