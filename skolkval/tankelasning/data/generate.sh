#!/bin/bash

PPATH=$(realpath ..)
. ../../../testdata_tools/gen.sh

ulimit -s unlimited

use_solution tankelasning.cpp

compile gen.py

samplegroup
sample sample1
sample sample2
sample sample3
sample sample4
sample sample5

group g1 100
include_group sample
tc_manual ../manual_data/secret1.in
tc_manual ../manual_data/secret2.in
tc_manual ../manual_data/secret3.in
tc_manual ../manual_data/secret4.in
tc_manual ../manual_data/secret5.in
tc_manual ../manual_data/edge_case01.in
tc_manual ../manual_data/edge_case02.in
tc_manual ../manual_data/edge_case03.in
tc_manual ../manual_data/edge_case04.in
tc_manual ../manual_data/edge_case05.in

