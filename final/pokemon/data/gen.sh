#!/bin/bash

# Set the problem name to generate correct file names
PROBLEMNAME="pokemon"

g++ ../submissions/accepted/pokemon_sl.cpp -o sol -std=gnu++11

# Set this if you want to generate answers.
SOLVER=sol

# 1. Create subdirectories and set them to "min"
#    grading mode.

mkdir -p secret

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
grader_flags: all 20" > secret/g1/testdata.yaml
echo "grading: custom
grader_flags: all 40" > secret/g2/testdata.yaml
echo "grading: custom
grader_flags: all 40" > secret/g3/testdata.yaml


echo "Generating group 1..."
cp small.01 secret/g1/$PROBLEMNAME.g1.1.in
cp small.02 secret/g1/$PROBLEMNAME.g1.2.in
cp small.03 secret/g1/$PROBLEMNAME.g1.3.in
./gen_random.py 8 8 4214 > secret/g1/$PROBLEMNAME.g1.4.in
./gen_random.py 8 8 5817 > secret/g1/$PROBLEMNAME.g1.5.in
./gen_random.py 8 8 9135 > secret/g1/$PROBLEMNAME.g1.6.in
./gen_tree.py 8 7 8234 > secret/g1/$PROBLEMNAME.g1.7.in
./gen_tree.py 8 7 1234 > secret/g1/$PROBLEMNAME.g1.8.in
./gen_tree.py 8 7 4321 > secret/g1/$PROBLEMNAME.g1.9.in

echo "Generating group 2..."
./gen_tree.py 1000 0 2378 > secret/g2/$PROBLEMNAME.g2.1.in
./gen_tree.py 1000 100 6543 > secret/g2/$PROBLEMNAME.g2.2.in
./gen_tree.py 1000 500 7623 > secret/g2/$PROBLEMNAME.g2.3.in
./gen_tree.py 1000 999 1453 > secret/g2/$PROBLEMNAME.g2.4.in
./gen_tree.py 1000 999 8673 > secret/g2/$PROBLEMNAME.g2.5.in
./gen_random.py 100 1000 643 > secret/g2/$PROBLEMNAME.g2.6.in
./gen_random.py 300 1000 5913 > secret/g2/$PROBLEMNAME.g2.7.in

echo "Generating group 3..."
./gen_tree.py 100000 99999 6436 > secret/g3/$PROBLEMNAME.g3.1.in
./gen_tree.py 100000 99999 8734 > secret/g3/$PROBLEMNAME.g3.2.in
./gen_random.py 600 179100 6245 > secret/g3/$PROBLEMNAME.g3.3.in
./gen_random.py 1000 200000 5235 > secret/g3/$PROBLEMNAME.g3.4.in
./gen_random.py 50000 200000 9999 > secret/g3/$PROBLEMNAME.g3.5.in
./gen_random.py 50000 200000 9998 > secret/g3/$PROBLEMNAME.g3.6.in

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
