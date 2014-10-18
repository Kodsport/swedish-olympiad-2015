#!/bin/bash

# Set the problem name to generate correct file names
PROBLEMNAME="hesthoppning"

g++ ../submissions/accepted/eo_ac.cc -o sol

# Set this if you want to generate answers.
SOLVER=sol

# 1. Create subdirectories and set them to "min"
#    grading mode.

subfolders=(secret/g1 secret/g2)
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
done

echo "grading: custom
grader_flags: all 40" > secret/g1/testdata.yaml
echo "grading: custom
grader_flags: all 60" > secret/g2/testdata.yaml

echo "Generating group 1..."
./gen_testcase.py 97 99 11 0.4 yes > secret/g1/$PROBLEMNAME.g1.1.in
./gen_testcase.py 95 94 21 0.7 no > secret/g1/$PROBLEMNAME.g1.2.in
./gen_testcase.py 96 90 31 0.4 yes > secret/g1/$PROBLEMNAME.g1.3.in
./gen_testcase.py 95 98 41 0.7 no > secret/g1/$PROBLEMNAME.g1.4.in
./gen_testcase.py 100 100 51 0.7 yes > secret/g1/$PROBLEMNAME.g1.5.in
./gen_testcase.py 100 100 61 0.7 no > secret/g1/$PROBLEMNAME.g1.6.in
./gen_testcase.py 100 100 71 0.8 yes > secret/g1/$PROBLEMNAME.g1.7.in
./gen_testcase.py 100 100 81 0.9 no > secret/g1/$PROBLEMNAME.g1.8.in
./gen_empty.py 100 100 yes > secret/g1/$PROBLEMNAME.g1.9.in
./gen_empty.py 100 100 no > secret/g1/$PROBLEMNAME.g1.10.in

echo "Generating group 2..."
./gen_testcase.py 497 499 12 0.4 yes > secret/g2/$PROBLEMNAME.g2.1.in
./gen_testcase.py 495 494 22 0.75 no > secret/g2/$PROBLEMNAME.g2.2.in
./gen_testcase.py 496 490 32 0.4 yes > secret/g2/$PROBLEMNAME.g2.3.in
./gen_testcase.py 495 498 42 0.75 no > secret/g2/$PROBLEMNAME.g2.4.in
./gen_testcase.py 500 500 52 0.7 yes > secret/g2/$PROBLEMNAME.g2.5.in
./gen_testcase.py 500 500 62 0.75 no > secret/g2/$PROBLEMNAME.g2.6.in
./gen_testcase.py 500 500 72 0.75 yes > secret/g2/$PROBLEMNAME.g2.7.in
./gen_testcase.py 500 500 82 0.9 no > secret/g2/$PROBLEMNAME.g2.8.in
./gen_empty.py 500 500 yes > secret/g2/$PROBLEMNAME.g2.9.in
./gen_empty.py 500 500 no > secret/g2/$PROBLEMNAME.g2.10.in

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
