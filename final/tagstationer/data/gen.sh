#!/bin/bash

PPATH=$(realpath ..)
. ../../../testdata_tools/gen.sh

ulimit -s unlimited

use_solution eo100.py

compile gen.py

samplegroup
sample sample01
sample sample02

group group1 20
include_group sample
tc g1-1 gen 11 seq1 8
tc g1-2 gen 12 seq2 8
tc g1-3 gen 13 seq3 8
tc g1-4 gen 14 random 8

group group2 20
tc g2-1 gen 21 seq1,e 1000
tc g2-2 gen 22 seq2,e 1000
tc g2-3 gen 23 seq3,e 1000
tc g2-4 gen 24 random,e 1000

group group3 30
include_group group1
include_group group2
tc g3-1 gen 31 seq1 1000
tc g3-2 gen 32 seq2 1000
tc g3-3 gen 33 seq3 1000
tc g3-4 gen 34 random 1000

group group4 30
include_group group3
tc g4-1 gen 42 seq1 60000
tc g4-2 gen 43 seq2 60000
tc g4-3 gen 44 seq3 60000
tc g4-4 gen 45 random 60000
