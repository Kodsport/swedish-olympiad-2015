#!/usr/bin/env bash

PPATH=$(realpath ..)
. ../../../testdata_tools/gen.sh


use_solution slow.py

samplegroup
sample sample1
sample sample2

group g1 11
tc sample1
tc_manual ../manual_data/secret1_1.in
tc_manual ../manual_data/secret1_2.in
tc_manual ../manual_data/secret1_3.in
tc_manual ../manual_data/secret1_4.in
tc_manual ../manual_data/secret1_5.in

group g2 11
include_group g1
tc sample2
tc_manual ../manual_data/secret2_1.in
tc_manual ../manual_data/secret2_2.in
tc_manual ../manual_data/secret2_3.in
tc_manual ../manual_data/secret2_4.in
tc_manual ../manual_data/secret2_5.in

group g3 37
include_group g1
tc_manual ../manual_data/secret3_1.in
tc_manual ../manual_data/secret3_2.in
tc_manual ../manual_data/secret3_3.in
tc_manual ../manual_data/secret3_4.in
tc_manual ../manual_data/secret3_5.in
tc_manual ../manual_data/secret3_6.in
tc_manual ../manual_data/secret3_7.in
tc_manual ../manual_data/secret3_8.in
tc_manual ../manual_data/secret3_9.in

group g4 41
include_group g2
include_group g3
tc_manual ../manual_data/secret4_1.in
tc_manual ../manual_data/secret4_2.in
tc_manual ../manual_data/secret4_3.in
tc_manual ../manual_data/secret4_4.in
tc_manual ../manual_data/secret4_5.in
tc_manual ../manual_data/secret4_6.in
tc_manual ../manual_data/secret4_7.in
tc_manual ../manual_data/secret4_8.in
tc_manual ../manual_data/secret4_9.in
