#!/bin/bash

PPATH=$(realpath ..)
. ../../../testdata_tools/gen.sh

ulimit -s unlimited

use_solution candy.py

samplegroup
sample candy1
sample candy2
sample candy3

group group1 30
tc candy1
tc_manual ../manual_data/candy01_1.in
tc_manual ../manual_data/candy01_2.in
tc_manual ../manual_data/candy01_3.in
tc_manual ../manual_data/candy02_1.in
tc_manual ../manual_data/candy02_2.in
tc_manual ../manual_data/candy02_3.in
tc_manual ../manual_data/candy03_1.in
tc_manual ../manual_data/candy03_2.in
tc_manual ../manual_data/candy03_3.in

group group2 70
tc candy2
tc candy3
tc_manual ../manual_data/candy04_1.in
tc_manual ../manual_data/candy04_2.in
tc_manual ../manual_data/candy04_3.in
tc_manual ../manual_data/candy05_1.in
tc_manual ../manual_data/candy05_2.in
tc_manual ../manual_data/candy05_3.in
tc_manual ../manual_data/candy06_1.in
tc_manual ../manual_data/candy06_2.in
tc_manual ../manual_data/candy06_3.in
tc_manual ../manual_data/candy07_1.in
tc_manual ../manual_data/candy07_2.in
tc_manual ../manual_data/candy07_3.in
tc_manual ../manual_data/candy08_1.in
tc_manual ../manual_data/candy08_2.in
tc_manual ../manual_data/candy08_3.in
tc_manual ../manual_data/candy09_1.in
tc_manual ../manual_data/candy09_2.in
tc_manual ../manual_data/candy09_3.in
tc_manual ../manual_data/candy10_1.in
tc_manual ../manual_data/candy10_2.in
tc_manual ../manual_data/candy10_3.in

