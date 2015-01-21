#!/usr/bin/python

import sys
import random

if len(sys.argv) < 4:
	print "Usage python gen_testcase min max seed"
	exit(0)

mi = int(sys.argv[1])
ma = int(sys.argv[2])
seed = int(sys.argv[3])
random.seed(seed)
print random.randint(mi, ma)	
