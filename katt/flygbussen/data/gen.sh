#!/bin/bash

PROBLEMNAME="flygbussen"

rm -rf secret
mkdir secret
cp testdata.yaml secret/

function group {
	groupname=$1
	points=$2
	mkdir secret/$groupname
	echo "grading: custom
grader_flags: all $points" > secret/$groupname/testdata.yaml
	ind=0
}

function testcase {
	ind=$((ind+1))

	seed=$points$ind
	maxn=$1
	echo $3 $2 $4 $5 $6 $seed | ruby generate.rb > secret/$groupname/$PROBLEMNAME.$groupname.$ind.in
	n=$(head -n 1 secret/$groupname/$PROBLEMNAME.$groupname.$ind.in | cut -f 1 -d ' ')
	echo "$groupname.$ind: $n <= $maxn"
	if [[ $n -gt $maxn ]]; then echo fail; fi
}

function testcase_large_time {
	ind=$((ind+1))
	cp large_time.txt secret/$groupname/$PROBLEMNAME.$groupname.$ind.in
}

g++ -std=c++11 -O2 ../submissions/accepted/solver_ported.cpp -o sol
SOLVER=./sol

# max_n, k, min_n, max_t, max_group_size, max_duplicate

# Resulting n will be around min_n * (max_duplicate/2 + 1).
# max_t should be around 10*k*min_n/max_group_size or rather less.

# N, K <= 15
group g1 13
testcase 15 5 4 61 4 4
testcase 15 2 13 30 2 0
testcase 15 15 4 100 2 5

# N <= 100000, K = 1
group g2 18
testcase 100000 1 99000 10000000 3 0
testcase 100000 1 18000 10000000 2 10
testcase 100000 1 70000 50000 3 1
testcase_large_time

# N, K <= 100
group g3 19
testcase 100 97 76 10000 10 1
testcase 100 84 90 1000 10 0
testcase 100 19 64 10000 10 2
testcase_large_time

# N <= 1000, K <= 100
group g4 23
testcase 1000 55 100 100000 60 5
testcase 1000 99 500 10000 60 2
testcase 1000 98 979 100000 40 0
testcase 1000 98 979 5000 40 0
testcase_large_time

# N <= 100000, K <= 100
group g5 27
testcase 100000 1 70000 50000 3 1
testcase 100000 100 5500 100000 60 15
testcase 100000 100 27000 1000000 60 6
testcase 100000 98 30001 10000 40 5
testcase 100000 98 30000 1000000 40 5
testcase 100000 98 98000 1000000 40 0
testcase_large_time

for i in g1 g2 g3 g4 g5
do
	for f in secret/$i/*.in
	do
		$SOLVER < $f > ${f%???}.ans
	done
done
