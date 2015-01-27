#!/bin/bash

# Set the problem name to generate correct file names
PROBLEMNAME="tavlingssal"

g++ ../submissions/accepted/emanuel_ac.cpp -o sol

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
grader_flags: all 40" > secret/g1/testdata.yaml
echo "grading: custom
grader_flags: all 30" > secret/g2/testdata.yaml
echo "grading: custom
grader_flags: all 30" > secret/g3/testdata.yaml

echo "Generating group 1..."
for i in {1..10}
do
	python gen_testcase.py 1 1000 $i > secret/g1/$PROBLEMNAME.g1.$i.in
done
python gen_testcase.py 1000 1000 0 > secret/g1/$PROBLEMNAME.g1.11.in

echo "Generating group 2..."
for i in {1..10}
do
	python gen_testcase.py 1001 1000000 $i > secret/g2/$PROBLEMNAME.g2.$i.in
done
python gen_testcase.py 994010 994010 0 > secret/g2/$PROBLEMNAME.g2.11.in
python gen_testcase.py 994009 994009 0 > secret/g2/$PROBLEMNAME.g2.12.in
python gen_testcase.py 1000000 1000000 0 > secret/g2/$PROBLEMNAME.g2.13.in

echo "Generating group 3..."
for i in {1..10}
do
	python gen_testcase.py 1000001 1000000000 $i > secret/g3/$PROBLEMNAME.g3.$i.in
done
python gen_testcase.py 899340122 899340122 0 > secret/g3/$PROBLEMNAME.g3.11.in
python gen_testcase.py 899340121 899340121 0 > secret/g3/$PROBLEMNAME.g3.12.in
python gen_testcase.py 1000000000 1000000000 0 > secret/g3/$PROBLEMNAME.g3.13.in

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
