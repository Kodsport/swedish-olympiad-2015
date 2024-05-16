#!/bin/bash

PPATH=$(realpath ..)
. ../../../testdata_tools/gen.sh

ulimit -s unlimited

use_solution arash_ac.py

samplegroup
sample sample1
sample sample2


group group1 100
tc sample1
tc sample2
tc_manual ../manual_data/secret1.in
tc_manual ../manual_data/secret2.in
tc_manual ../manual_data/secret3.in
tc_manual ../manual_data/edge_case01.in
tc_manual ../manual_data/edge_case02.in

