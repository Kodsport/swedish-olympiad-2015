#!/bin/bash

# Set the problem name to generate correct file names
PROBLEMNAME="hesthoppning"

g++ ../submissions/accepted/eo_ac.cc -o sol

# Set this if you want to generate answers.
SOLVER=sol

# 1. Create subdirectories and set them to "min"
#    grading mode.

subfolders=(secret/g1 secret/g2 secret/g3 secret/g4 secret/g5)
for i in ${subfolders[@]}
do
    if [ ! -d $i ]
    then
        mkdir $i
    fi
    if [ ! -f $i/testdata.yaml ]
    then
        touch $i/testdata.yaml
    fi
    echo "grading: custom
grader_flags: all 20" > $i/testdata.yaml
done

# small data sets
small=(1 2)

for i in ${small[@]}
do
    echo $i
    # one line here per file in test group
    ./gen_testcase.py 97 99 1$i 0.4 yes > secret/g$i/$PROBLEMNAME.g$i.1.in
    ./gen_testcase.py 95 94 2$i 0.7 no > secret/g$i/$PROBLEMNAME.g$i.2.in
    ./gen_testcase.py 100 100 3$i 0.7 yes > secret/g$i/$PROBLEMNAME.g$i.3.in
    ./gen_testcase.py 100 100 4$i 0.7 no > secret/g$i/$PROBLEMNAME.g$i.4.in
    ./gen_empty.py 100 100 yes > secret/g$i/$PROBLEMNAME.g$i.5.in
    ./gen_empty.py 100 100 no > secret/g$i/$PROBLEMNAME.g$i.6.in
done

# large data sets
large=(3 4 5)

for i in ${large[@]}
do
    echo $i
    # one line here per file in test group
    ./gen_testcase.py 495 488 11$i 0.5 yes > secret/g$i/$PROBLEMNAME.g$i.1.in
    ./gen_testcase.py 499 498 22$i 0.85 no > secret/g$i/$PROBLEMNAME.g$i.2.in
    ./gen_testcase.py 500 500 33$i 0.7 yes > secret/g$i/$PROBLEMNAME.g$i.3.in
    ./gen_testcase.py 500 500 44$i 0.85 no > secret/g$i/$PROBLEMNAME.g$i.4.in
    ./gen_empty.py 500 500 yes > secret/g$i/$PROBLEMNAME.g$i.5.in
    ./gen_empty.py 500 500 no > secret/g$i/$PROBLEMNAME.g$i.6.in
done

# generate solutions for all files
if [[ ! -z $SOLVER ]]
then
    for i in ${subfolders[@]}
    do
        for f in $i/*.in
        do
            echo "solving $f"
            ./$SOLVER < $f > ${f%???}.ans
        done
    done
fi
