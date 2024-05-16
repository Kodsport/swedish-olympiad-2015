#!/bin/bash

PPATH=$(realpath ..)
. ../../../testdata_tools/gen.sh

ulimit -s unlimited

use_solution emanuel_ac.cpp

compile gen_testcase.py

samplegroup
sample sample01
sample sample02
sample sample03

group group1 40
include_group sample
tc g1-1 gen_testcase 1 1000
tc g1-2 gen_testcase 1 1000
tc g1-3 gen_testcase 1 1000
tc g1-4 gen_testcase 1 1000
tc g1-5 gen_testcase 1 1000
tc g1-6 gen_testcase 1 1000
tc g1-7 gen_testcase 1 1000
tc g1-8 gen_testcase 1000 1000

group group2 30
include_group group1
tc g2-1 gen_testcase 1001 1000000
tc g2-2 gen_testcase 1001 1000000
tc g2-3 gen_testcase 1001 1000000
tc g2-4 gen_testcase 1001 1000000
tc g2-5 gen_testcase 1001 1000000
tc g2-6 gen_testcase 1001 1000000
tc g2-7 gen_testcase 994010 994010
tc g2-8 gen_testcase 994009 994009
tc g2-9 gen_testcase 1000000 1000000

group group3 30
include_group group2
tc g3-1 gen_testcase 1000001 1000000000
tc g3-2 gen_testcase 1000001 1000000000
tc g3-3 gen_testcase 1000001 1000000000
tc g3-4 gen_testcase 1000001 1000000000
tc g3-5 gen_testcase 1000001 1000000000
tc g3-6 gen_testcase 899340122 899340122
tc g3-7 gen_testcase 899340121 899340121
tc g3-8 gen_testcase 1000000000 1000000000
