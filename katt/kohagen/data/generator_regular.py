# Usage: python generator_regular.py n_min n_max r_min r_max seed

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
step = 360.0/n	
start = random.random()*step	
a = [str(start + step*i) for i in range(n)]
print ' '.join([str(n), str(m), str(r)])	
print ' '.join(a)	
