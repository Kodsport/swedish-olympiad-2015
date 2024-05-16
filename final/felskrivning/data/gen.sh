#!/bin/bash

PPATH=$(realpath ..)
. ../../../testdata_tools/gen.sh

ulimit -s unlimited

use_solution felskrivning.py

samplegroup
sample felskrivning01
sample felskrivning02
sample felskrivning03
sample felskrivning04

group group1 30
tc felskrivning01
tc_manual ../manual_data/felskrivning00_1.in
tc_manual ../manual_data/felskrivning00_2.in
tc_manual ../manual_data/felskrivning00_3.in
tc_manual ../manual_data/felskrivning00_4.in
tc_manual ../manual_data/felskrivning00_5.in

group group2 30
include_group group1
tc felskrivning02
tc felskrivning03
tc felskrivning04
tc_manual ../manual_data/felskrivning01_1.in
tc_manual ../manual_data/felskrivning01_2.in
tc_manual ../manual_data/felskrivning01_3.in
tc_manual ../manual_data/felskrivning01_4.in
tc_manual ../manual_data/felskrivning01_5.in

group group3 40
include_group group2
tc_manual ../manual_data/felskrivning02_1.in
tc_manual ../manual_data/felskrivning02_2.in
tc_manual ../manual_data/felskrivning02_3.in
tc_manual ../manual_data/felskrivning02_4.in
tc_manual ../manual_data/felskrivning02_5.in

