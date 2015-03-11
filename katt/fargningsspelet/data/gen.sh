#!/bin/bash

PROBLEMNAME="fargningsspelet"

rm -rf secret
mkdir secret

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
	echo $2 $1 > secret/$groupname/$PROBLEMNAME.$groupname.$ind.in
	echo $3 > secret/$groupname/$PROBLEMNAME.$groupname.$ind.ans
}

group g1 25
testcase 1 2 0
testcase 1 5 0
testcase 1 8 0
testcase 1 13 0

group g2 25
testcase 1 2 0
testcase 1 5 0
testcase 1 13 0
testcase 1 980 0
testcase 1 981 0

# strategy = 0 (random), 0 (start with 1), 1 (start with N), 2 (start with middle), 3 (end with middle)
group g3 25
testcase 2 2 1
testcase 2 3 1
testcase 2 3 2
testcase 2 9 4
testcase 2 10 4
testcase 2 11 3
testcase 2 11 4
testcase 2 12 1
testcase 2 12 2
testcase 2 12 4
testcase 2 13 1
testcase 2 13 2
testcase 2 13 3
testcase 2 13 4

group g4 25
testcase 2 2 1
testcase 2 3 1
testcase 2 3 2
testcase 2 978 1
testcase 2 978 2
testcase 2 978 4
testcase 2 979 1
testcase 2 979 2
testcase 2 979 3
testcase 2 979 4
testcase 2 980 4
testcase 2 981 3
testcase 2 981 4
testcase 2 982 4
testcase 2 983 3
testcase 2 983 4
