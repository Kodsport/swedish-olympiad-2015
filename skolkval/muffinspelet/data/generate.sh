#!/bin/bash

PPATH=$(realpath ..)
. ../../../testdata_tools/gen.sh

ulimit -s unlimited

use_solution muffinspelet_js.cc

compile gen.py

samplegroup
sample sample1
sample sample2
sample sample3
sample sample4

group g1 50
tc sample1
tc sample2
tc sample3
tc sample4
tc_manual ../manual_data/secret1.in
tc_manual ../manual_data/secret2.in
tc g1-01 gen n=20
tc g1-02 gen n=19
tc g1-03 gen n=16
tc g1-04 gen n=7
tc g1-05 gen n=3



group g2 50
include_group g1
tc_manual ../manual_data/secret3.in
tc g2-01 gen 
tc g2-02 gen n=8192 #2**13
tc g2-03 gen n=8191 #2**13 - 1 
tc g2-04 gen n=10000
