#!/bin/bash

PPATH=$(realpath ..)
. ../../../testdata_tools/gen.sh

ulimit -s unlimited

use_solution eo100.py

compile gen_random.py
compile gen_tree.py

samplegroup
sample sample1
sample sample2
sample sample3

group group1 20
include_group sample
tc g1-1 gen_random 8 8 4214
tc g1-2 gen_random 8 8 5817
tc g1-3 gen_random 8 8 9135
tc g1-4 gen_tree 8 7 8234
tc g1-5 gen_tree 8 7 1234
tc g1-6 gen_tree 8 7 4321
tc_manual small1
tc_manual small2
tc_manual small3

group group2 40
tc g2-1 gen_tree 1000 0 2378
tc g2-2 gen_tree 1000 100 6543
tc g2-3 gen_tree 1000 500 7623
tc g2-4 gen_tree 1000 999 1453
tc g2-5 gen_tree 1000 999 8673

group group3 40
include_group group1
include_group group2
tc g3-1 gen_tree   100000 99999 6436
tc g3-2 gen_tree   100000 99999 8734
tc g3-3 gen_random 600 179100 6245
tc g3-4 gen_random 1000 200000 5235
tc g3-5 gen_random 50000 200000 9999
tc g3-6 gen_random 50000 200000 9998

