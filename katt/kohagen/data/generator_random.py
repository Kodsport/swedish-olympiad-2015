#Usage: python generator_random.py n_min n_max r_min r_max seed

import random
import sys

if len(sys.argv) != 6:
	print 'Wrong number of arguments'
	sys.exit(1)
s = int(sys.argv[5])
random.seed(s)	
n = random.randint(int(sys.argv[1]), int(sys.argv[2]))
r = random.randint(int(sys.argv[3]), int(sys.argv[4]))	
m = int(r*r + random.random()*r*r)	
a = []
for i in range(n):
	a.append(str(random.random()*360))
print ' '.join([str(n), str(m), str(r)])	
print ' '.join(a)	
