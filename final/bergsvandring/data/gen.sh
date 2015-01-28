#!/bin/bash

# Set the problem name to generate correct file names
PROBLEMNAME="bergsvandring"

g++ ../submissions/accepted/simon100.cc -o sol

# Set this if you want to generate answers.
SOLVER=sol

subfolders=(secret/g1 secret/g2)
for i in ${subfolders[@]}
do
    if [ ! -d $i ]
    then
        mkdir $i
    fi
done

echo "grading: custom
grader_flags: all 40" > secret/g1/testdata.yaml
echo "grading: custom
grader_flags: all 60" > secret/g2/testdata.yaml

echo "Generating group 1..."
./gen_testcase.py 13 convex 100 99.1 > secret/g1/$PROBLEMNAME.g1.1.in
./gen_testcase.py 23 convex 100 48.3 > secret/g1/$PROBLEMNAME.g1.2.in
./gen_testcase.py 33 convex 100 52.1 > secret/g1/$PROBLEMNAME.g1.3.in
./gen_testcase.py 63 concave 100 98 > secret/g1/$PROBLEMNAME.g1.4.in
./gen_testcase.py 73 valleys 98 98 > secret/g1/$PROBLEMNAME.g1.5.in
./gen_testcase.py 83 valleys 100 100 > secret/g1/$PROBLEMNAME.g1.6.in
./gen_testcase.py 93 random,100000,4000 100 1.3 > secret/g1/$PROBLEMNAME.g1.7.in
./gen_testcase.py 14 tops 100 53 > secret/g1/$PROBLEMNAME.g1.8.in
./gen_testcase.py 24 tops2 100 18 > secret/g1/$PROBLEMNAME.g1.9.in
./gen_testcase.py 54 repeated 100 0.54 > secret/g1/$PROBLEMNAME.g1.10.in

echo "Generating group 2..."
./gen_testcase.py 11 convex 1000 999.1 > secret/g2/$PROBLEMNAME.g2.1.in
./gen_testcase.py 21 convex 1000 998.8 > secret/g2/$PROBLEMNAME.g2.2.in
./gen_testcase.py 31 convex 1000 499.95 > secret/g2/$PROBLEMNAME.g2.3.in
./gen_testcase.py 41 convex 1000 500.1 > secret/g2/$PROBLEMNAME.g2.4.in
./gen_testcase.py 51 concave 1000 1000 > secret/g2/$PROBLEMNAME.g2.5.in
./gen_testcase.py 61 concave 1000 998 > secret/g2/$PROBLEMNAME.g2.6.in
./gen_testcase.py 71 valleys 998 998 > secret/g2/$PROBLEMNAME.g2.7.in
./gen_testcase.py 81 valleys 1000 789 > secret/g2/$PROBLEMNAME.g2.8.in
./gen_testcase.py 91 random,100000,1000 1000 50 > secret/g2/$PROBLEMNAME.g2.9.in
./gen_testcase.py 12 random,100000,4000 1000 12.54 > secret/g2/$PROBLEMNAME.g2.10.in
./gen_testcase.py 22 tops 1000 897.25 > secret/g2/$PROBLEMNAME.g2.11.in
./gen_testcase.py 32 tops2 1000 22.3 > secret/g2/$PROBLEMNAME.g2.12.in
./gen_testcase.py 42 tops 996 897.25 > secret/g2/$PROBLEMNAME.g2.13.in
./gen_testcase.py 52 tops 989 0.543 > secret/g2/$PROBLEMNAME.g2.14.in
./gen_testcase.py 62 repeated 1000 0.2 > secret/g2/$PROBLEMNAME.g2.15.in


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
