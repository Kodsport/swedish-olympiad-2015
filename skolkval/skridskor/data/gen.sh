#!/bin/bash

# Set the problem name to generate correct file names
PROBLEMNAME="skridskor"

g++ ../submissions/accepted/osk_ac.cc -o sol

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

g++ generate.cc -o generate

echo "Generating group 1..."
echo "10 10 10 5" | ./generate > secret/g1/$PROBLEMNAME.g1.1.in
echo "10 10 15 6" | ./generate > secret/g1/$PROBLEMNAME.g1.2.in
echo "10 10 20 7" | ./generate > secret/g1/$PROBLEMNAME.g1.3.in
echo "10 10 25 8" | ./generate > secret/g1/$PROBLEMNAME.g1.4.in
echo "10 10 50 9" | ./generate > secret/g1/$PROBLEMNAME.g1.5.in

echo "Generating group 2..."
echo "50 50 500 10" | ./generate > secret/g2/$PROBLEMNAME.g2.1.in
echo "50 50 700 11" | ./generate > secret/g2/$PROBLEMNAME.g2.2.in
echo "50 50 900 12" | ./generate > secret/g2/$PROBLEMNAME.g2.3.in
echo "50 50 1100 13" | ./generate > secret/g2/$PROBLEMNAME.g2.4.in
echo "50 50 2500 14" | ./generate > secret/g2/$PROBLEMNAME.g2.5.in

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
