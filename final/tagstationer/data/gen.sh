#!/bin/bash

# Set the problem name to generate correct file names
PROBLEMNAME="tagstationer"

g++ ../submissions/accepted/tagstationer.cpp -std=c++0x -o sol

# Set this if you want to generate answers.
SOLVER=sol

rm -rf secret
mkdir -p secret

subfolders=(secret/g1 secret/g2 secret/g3 secret/g4)
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
grader_flags: all 30" > secret/g3/testdata.yaml
echo "grading: custom
grader_flags: all 30" > secret/g4/testdata.yaml

echo "Generating group 1..."
python3 gen.py 11 seq1 8 > secret/g1/$PROBLEMNAME.g1.1.in
python3 gen.py 12 seq2 8 > secret/g1/$PROBLEMNAME.g1.2.in
python3 gen.py 13 seq3 8 > secret/g1/$PROBLEMNAME.g1.3.in
python3 gen.py 14 random 8 > secret/g1/$PROBLEMNAME.g1.4.in

echo "Generating group 2..."
python3 gen.py 21 seq1,e 1000 > secret/g2/$PROBLEMNAME.g2.1.in
python3 gen.py 22 seq2,e 1000 > secret/g2/$PROBLEMNAME.g2.2.in
python3 gen.py 23 seq3,e 1000 > secret/g2/$PROBLEMNAME.g2.3.in
python3 gen.py 24 random,e 1000 > secret/g2/$PROBLEMNAME.g2.4.in

echo "Generating group 3..."
python3 gen.py 31 seq1 1000 > secret/g3/$PROBLEMNAME.g3.1.in
python3 gen.py 32 seq2 1000 > secret/g3/$PROBLEMNAME.g3.2.in
python3 gen.py 33 seq3 1000 > secret/g3/$PROBLEMNAME.g3.3.in
python3 gen.py 34 random 1000 > secret/g3/$PROBLEMNAME.g3.4.in

echo "Generating group 4..."
python3 gen.py 42 seq1 60000 > secret/g4/$PROBLEMNAME.g4.1.in
python3 gen.py 43 seq2 60000 > secret/g4/$PROBLEMNAME.g4.2.in
python3 gen.py 44 seq3 60000 > secret/g4/$PROBLEMNAME.g4.3.in
python3 gen.py 45 random 60000 > secret/g4/$PROBLEMNAME.g4.4.in


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
