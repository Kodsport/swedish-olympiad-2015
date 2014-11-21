#!/bin/bash

# Set the problem name to generate correct file names
PROBLEMNAME="skridskor"

g++ ../submissions/accepted/osk_ac.cc -o sol

# Set this if you want to generate answers.
SOLVER=sol

# 1. Create subdirectories and set them to "min"
#    grading mode.

subfolders=(secret/g1 secret/g2 secret/g3)
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
grader_flags: all 30" > secret/g2/testdata.yaml
echo "grading: custom
grader_flags: all 30" > secret/g3/testdata.yaml

g++ generate.cc -o generate -O3

echo "Generating group 1..."
echo "3 10 10 5" | ./generate > secret/g1/$PROBLEMNAME.g1.1.in
echo "10 10 15 6" | ./generate > secret/g1/$PROBLEMNAME.g1.2.in
echo "3 15 40 7" | ./generate > secret/g1/$PROBLEMNAME.g1.3.in
echo "15 15 400 8" | ./generate > secret/g1/$PROBLEMNAME.g1.4.in
echo "15 15 200 9" | ./generate > secret/g1/$PROBLEMNAME.g1.5.in
echo "15 15 112 10" | ./generate > secret/g1/$PROBLEMNAME.g1.6.in
echo "15 15 112 11" | ./generate > secret/g1/$PROBLEMNAME.g1.7.in

echo "Generating group 2..."
echo "3 50 500 11" | ./generate > secret/g2/$PROBLEMNAME.g2.1.in
echo "50 50 700 50" | ./generate > secret/g2/$PROBLEMNAME.g2.2.in
echo "50 50 700 1337" | ./generate > secret/g2/$PROBLEMNAME.g2.3.in
echo "50 50 1100 13" | ./generate > secret/g2/$PROBLEMNAME.g2.4.in
echo "50 50 620 14145" | ./generate > secret/g2/$PROBLEMNAME.g2.5.in
echo "50 50 1250 14146" | ./generate > secret/g2/$PROBLEMNAME.g2.6.in

echo "Generating group 3..."
echo "1.."
echo "100 100 10000 31" | ./generate > secret/g3/$PROBLEMNAME.g3.1.in
echo "2.."
echo "100 100 1500 32" | ./generate > secret/g3/$PROBLEMNAME.g3.2.in
echo "3.."
echo "3 100 400 33" | ./generate > secret/g3/$PROBLEMNAME.g3.3.in
echo "4.."
echo "50 100 2500 34" | ./generate > secret/g3/$PROBLEMNAME.g3.4.in
echo "5.."
echo "100 100 10000 35" | ./generate > secret/g3/$PROBLEMNAME.g3.5.in
echo "6.."
echo "100 100 100 36" | ./generate > secret/g3/$PROBLEMNAME.g3.6.in
echo "7.."
echo "100 100 5000 3259" | ./generate > secret/g3/$PROBLEMNAME.g3.7.in
echo "8.."
echo "100 100 5000 420" | ./generate > secret/g3/$PROBLEMNAME.g3.8.in

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
