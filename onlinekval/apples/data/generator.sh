#!/usr/bin/env bash

. ../../testdata_tools/gen.sh

use_solution apples_eo.cpp

compile gen.cc

samplegroup
sample 1

group same_group 50
limits same=yes
tc same_5_5 gen 45234 5 5 1
tc same_5_10 gen 35474 5 10 1
tc same_5_15 gen 81240 5 15 1
tc same_10_5 gen 92837 10 5 1
tc same_10_10 gen 12354 10 10 1
tc same_10_15 gen 28953 10 15 1
tc same_15_5 gen 23435 15 5 1
tc same_15_10 gen 24584 15 10 1
tc same_15_15 gen 91754 15 15 1

group different_group 50
limits same=no
tc 1
include_group same_group
tc different_5_5 gen 45234 5 5 0
tc different_5_10 gen 35474 5 10 0
tc different_5_15 gen 81240 5 15 0
tc different_10_5 gen 92837 10 5 0
tc different_10_10 gen 12354 10 10 0
tc different_10_15 gen 28953 10 15 0
tc different_15_5 gen 23435 15 5 0
tc different_15_10 gen 24584 15 10 0
tc different_15_15 gen 91754 15 15 0
