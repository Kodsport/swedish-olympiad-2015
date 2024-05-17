#!/bin/bash

PPATH=$(realpath ..)
. ../../../testdata_tools/gen.sh

ulimit -s unlimited

use_solution arash_ac.py

compile gen.py

samplegroup
sample sample1
sample sample2


group g1 100
tc sample1
tc sample2
tc_manual ../manual_data/secret1.in
tc_manual ../manual_data/secret2.in
tc_manual ../manual_data/secret3.in
tc g1-01 gen n=2 tot=2
tc g1-02 gen n=2 tot=1000
tc g1-03 gen 
tc g1-04 gen 
tc g1-05 gen n=35 tot=123
tc g1-06 gen n=35 tot=76

