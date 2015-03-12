#Usage: python generator_manual.py n m r seed

import random
import sys

if len(sys.argv) != 5:
	print 'Wrong number of arguments'
	sys.exit(1)
s = int(sys.argv[4])
n = int(sys.argv[1])
m = int(sys.argv[2])
r = int(sys.argv[3])	
random.seed(s)	
a = []
for i in range(n):
	a.append(str(random.random()*360))
print ' '.join([str(n), str(m), str(r)])	
print ' '.join(a)	
