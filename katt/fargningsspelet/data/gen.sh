#!/bin/bash

PPATH=$(realpath ..)
. ../../../testdata_tools/gen.sh


use_solution ../zero.cpp


compile gen.py

# strategy = 0 (random), 1 (start with 1), 2 (start with N), 3 (start with middle), 4 (end with middle)
group g1 23
tc g1-1 gen 1 2 0
tc g1-2 gen 1 5 0
tc g1-3 gen 1 8 0
tc g1-4 gen 1 11 3
tc g1-5 gen 1 13 0

group g2 26
tc g2-1 gen 1 2 0
tc g2-2 gen 1 5 0
tc g2-3 gen 1 11 3
tc g2-4 gen 1 13 0
tc g2-5 gen 1 980 0
tc g2-6 gen 1 981 0


group g3 24
tc g3-1  gen 2 2 1
tc g3-2  gen 2 3 1
tc g3-3  gen 2 3 2
tc g3-4  gen 2 5 3
tc g3-5  gen 2 6 4
tc g3-6  gen 2 8 4
tc g3-7  gen 2 9 4
tc g3-8  gen 2 10 4
tc g3-9  gen 2 11 3
tc g3-10 gen  2 11 4
tc g3-11 gen  2 12 1
tc g3-12 gen  2 12 2
tc g3-13 gen  2 12 4
tc g3-14 gen  2 13 1
tc g3-15 gen  2 13 2
tc g3-16 gen  2 13 3
tc g3-17 gen  2 13 4


group g4 27
tc g4-1 gen 2 2 1
tc g4-2 gen 2 3 1
tc g4-3 gen 2 3 2
tc g4-4 gen 2 5 3
tc g4-5 gen 2 6 4
tc g4-6 gen 2 8 4
tc g4-7 gen 2 9 4
tc g4-8 gen 2 978 1
tc g4-9 gen 2 978 2
tc g4-10 gen 2 978 4
tc g4-11 gen 2 979 1
tc g4-12 gen 2 979 2
tc g4-13 gen 2 979 3
tc g4-14 gen 2 979 4
tc g4-15 gen 2 980 4
tc g4-16 gen 2 981 3
tc g4-17 gen 2 981 4
tc g4-18 gen 2 982 4
tc g4-19 gen 2 983 3
tc g4-20 gen 2 983 4
