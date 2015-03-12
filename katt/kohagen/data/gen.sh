#!/bin/bash

# Set the problem name to generate correct file names
PROBLEMNAME="kohagen"

g++ -O2 ../submissions/accepted/emanuel_ac.cpp -o sol
g++ -O2 generator_max.cpp -o generator_max.out

# Set this if you want to generate answers.
SOLVER=sol

# 1. Create subdirectories and set them to "min"
#    grading mode.

mkdir -p secret
subfolders=(secret/g1 secret/g2 secret/g3 secret/g4 secret/g5)
for i in ${subfolders[@]}
do
	rm -rf $i
	mkdir $i
	touch $i/testdata.yaml
done

echo "grading: custom
grader_flags: all 20" > secret/g1/testdata.yaml
echo "grading: custom
grader_flags: all 20" > secret/g2/testdata.yaml
echo "grading: custom
grader_flags: all 30" > secret/g3/testdata.yaml
echo "grading: custom
grader_flags: all 20" > secret/g4/testdata.yaml
echo "grading: custom
grader_flags: all 10" > secret/g5/testdata.yaml

echo "Generating group 1..."
for i in {1..5}
do
	python generator_random.py 4 50 10 1000 $i > secret/g1/$PROBLEMNAME.g1.$i.in
done
python generator_manual.py 50 1000 1 6 > secret/g1/$PROBLEMNAME.g1.6.in

echo "Generating group 2..."
for i in {1..5}
do
	python generator_regular.py 4 200 10 1000 $i > secret/g2/$PROBLEMNAME.g2.$i.in
done
python generator_regular.py 200 200 900 1000 6 > secret/g2/$PROBLEMNAME.g2.6.in

echo "Generating group 3..."
echo '142 513 1' | ./generator_max.out > secret/g3/$PROBLEMNAME.g3.1.in
echo '160 914 2' | ./generator_max.out > secret/g3/$PROBLEMNAME.g3.2.in
echo '74 755 3' | ./generator_max.out > secret/g3/$PROBLEMNAME.g3.3.in
echo '200 999 4' | ./generator_max.out > secret/g3/$PROBLEMNAME.g3.4.in
echo '200 811 5' | ./generator_max.out > secret/g3/$PROBLEMNAME.g3.5.in

echo "Generating group 4..."
for i in {1..5}
do
	python generator_random.py 100 200 10 1000 $i > secret/g4/$PROBLEMNAME.g4.$i.in
done
python generator_manual.py 200 1000 1 6 > secret/g4/$PROBLEMNAME.g4.6.in
python generator_random.py 200 200 900 1000 7 > secret/g4/$PROBLEMNAME.g4.7.in

echo "Generating group 5..."
for i in {1..5}
do
	python generator_random.py 300 400 10 1000 $i > secret/g5/$PROBLEMNAME.g5.$i.in
done
python generator_manual.py 400 1000 1 6 > secret/g5/$PROBLEMNAME.g5.6.in
for i in {7..10}
do
	python generator_random.py 400 400 10 1000 $i > secret/g5/$PROBLEMNAME.g5.$i.in
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
