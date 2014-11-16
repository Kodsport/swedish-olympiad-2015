#!/bin/bash

# Set the problem name to generate correct file names
PROBLEMNAME="bergskedja"

g++ ../submissions/accepted/eo_100.cc -o sol

# Set this if you want to generate answers.
SOLVER=sol

subfolders=(secret/g1 secret/g2 secret/g3)
for i in ${subfolders[@]}
do
    if [ ! -d $i ]
    then
        mkdir $i
    fi
done

echo "grading: custom
grader_flags: all 20" > secret/g1/testdata.yaml
echo "grading: custom
grader_flags: all 20" > secret/g2/testdata.yaml
echo "grading: custom
grader_flags: all 60" > secret/g3/testdata.yaml

echo "Generating group 1..."
./gen_testcase.py 100 100 100 11 0 > secret/g1/$PROBLEMNAME.g1.1.in
./gen_testcase.py 100 100 100 21 0 > secret/g1/$PROBLEMNAME.g1.2.in
./gen_testcase.py 100 100 100 31 0 > secret/g1/$PROBLEMNAME.g1.3.in
./gen_testcase.py 100 100 100 41 0 > secret/g1/$PROBLEMNAME.g1.4.in
./gen_testcase.py 100 100 100 51 0 > secret/g1/$PROBLEMNAME.g1.5.in
./gen_testcase.py 100 100 100 61 1 > secret/g1/$PROBLEMNAME.g1.6.in
./gen_testcase.py 100 100 100 71 1 > secret/g1/$PROBLEMNAME.g1.7.in
./gen_testcase.py 100 100 100 81 2 > secret/g1/$PROBLEMNAME.g1.8.in

echo "Generating group 2..."
./gen_testcase.py 100000 1000 1000 12 0 > secret/g2/$PROBLEMNAME.g2.1.in
./gen_testcase.py 100000 1000 1000 22 0 > secret/g2/$PROBLEMNAME.g2.2.in
./gen_testcase.py 100000 1000 1000 32 0 > secret/g2/$PROBLEMNAME.g2.3.in
./gen_testcase.py 100000 1000 1000 42 0 > secret/g2/$PROBLEMNAME.g2.4.in
./gen_testcase.py 100000 1000 1000 52 1 > secret/g2/$PROBLEMNAME.g2.5.in
./gen_testcase.py 100000 1000 1000 62 1 > secret/g2/$PROBLEMNAME.g2.6.in
./gen_testcase.py 100000 1000 1000 72 2 > secret/g2/$PROBLEMNAME.g2.7.in
./gen_testcase.py 100000 1000 1000 82 2 > secret/g2/$PROBLEMNAME.g2.8.in

echo "Generating group 3..."
./gen_testcase.py 100000 100000 10000 13 0 > secret/g3/$PROBLEMNAME.g3.1.in
./gen_testcase.py 100000 100000 10000 23 0 > secret/g3/$PROBLEMNAME.g3.2.in
./gen_testcase.py 100000 100000 10000 33 0 > secret/g3/$PROBLEMNAME.g3.3.in
./gen_testcase.py 100000 100000 10000 43 1 > secret/g3/$PROBLEMNAME.g3.4.in
./gen_testcase.py 100000 100000 10000 53 1 > secret/g3/$PROBLEMNAME.g3.5.in
./gen_testcase.py 100000 100000 10000 63 1 > secret/g3/$PROBLEMNAME.g3.6.in
./gen_testcase.py 100000 100000 10000 73 2 > secret/g3/$PROBLEMNAME.g3.7.in
./gen_testcase.py 100000 100000 10000 83 5 > secret/g3/$PROBLEMNAME.g3.8.in

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
