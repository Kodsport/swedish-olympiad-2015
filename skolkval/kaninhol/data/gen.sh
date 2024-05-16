#!/bin/bash

PPATH=$(realpath ..)
. ../../../testdata_tools/gen.sh

ulimit -s unlimited

use_solution arash_ac.py

compile gen.py

samplegroup
sample sample1
sample sample2


group group1 100
tc sample1
tc sample2
tc_manual ../manual_data/secret1.in
tc_manual ../manual_data/secret2.in
tc_manual ../manual_data/secret3.in
tc g1-01 gen n=2 h1=1 h2=1 h3=1
tc g1-02 gen n=9 h1=1 h2=6 h3=1
tc g1-03 gen n=9 h1=2 h2=8 h3=3
tc g1-04 gen n=9 
tc g1-05 gen n=10 
tc g1-06 gen n=10 
