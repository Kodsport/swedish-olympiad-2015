#!/usr/bin/env bash

PROBLENAME=kentbuggen
SOLVER=sol
AC_SOLUTION=kentbuggen_js.cpp

g++ ../submissions/accepted/$AC_SOLUTION -o $SOLVER -std=gnu++11

SUB=(secret/g1 secret/g2)

for i in ${SUB[@]}
do
	if [ ! -d $i ]
	then
		mkdir $i
	fi
done

cat > secret/g1/testdata.yaml << END
grading: custom
grader_flags: all 50
END

cat > secret/g2/testdata.yaml << END
grading: custom
grader_flags: all 50
END


g++ gen_random.cpp -o gen

echo "Generating group 1"
./gen 10 1 41241 > secret/g1/random_10_1.in
./gen 10 3 41242 > secret/g1/random_10_3.in
./gen 10 8 41243 > secret/g1/random_10_8.in
./gen 10 10 41244 > secret/g1/random_10_10.in
./gen 1000 1 41245 > secret/g1/random_1000_1.in
./gen 1000 10 41246 > secret/g1/random_1000_10.in
./gen 1000 300 41247 > secret/g1/random_1000_300.in
./gen 1000 800 42148 > secret/g1/random_1000_800.in
./gen 1000 1000 41249 > secret/g1/random_1000_1000.in

echo "Generating group 2"
./gen 100000 1 412410 > secret/g2/random_100000_1.in
./gen 100000 1000 412411 > secret/g2/random_100000_1000.in
./gen 100000 10000 412412 > secret/g2/random_100000_10000.in
./gen 100000 30000 412413 > secret/g2/random_100000_30000.in
./gen 100000 80000 412414 > secret/g2/random_100000_80000.in
./gen 100000 100000 421415 > secret/g2/random_100000_100000.in

if [[ ! -z $SOLVER ]]
then
	for i in ${SUB[@]}
	do
		for input in $i/*.in
		do
			echo "Solving $input"
			./$SOLVER < $input > ${input%???}.ans
		done
	done
fi

shopt -s globstar
for x in **/*.in 
do
	./sol < $x > `echo $x | cut -d. -f 1`.ans
done
