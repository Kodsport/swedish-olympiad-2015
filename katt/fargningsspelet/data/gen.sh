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
	sind=$(printf "%02d" $ind)
	echo $2 $1 > secret/$groupname/$PROBLEMNAME.$groupname.$sind.in
	echo $3 > secret/$groupname/$PROBLEMNAME.$groupname.$sind.ans
}

# strategy = 0 (random), 1 (start with 1), 2 (start with N), 3 (start with middle), 4 (end with middle)
group g1 23
testcase 1 2 0
testcase 1 5 0
testcase 1 8 0
testcase 1 11 3
testcase 1 13 0

group g2 26
testcase 1 2 0
testcase 1 5 0
testcase 1 11 3
testcase 1 13 0
testcase 1 980 0
testcase 1 981 0

group g3 24
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

group g4 27
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
