import random

s = int(input())
random.seed(s)	
n = random.randint(100, 400)
m = random.randint(100, 1000)
r = random.randint(100, 1000)
step = 360.0/n	
start = random.random()*step	
a = [str(start + step*i) for i in range(n)]
print ' '.join([str(n), str(m), str(r)])	
print ' '.join(a)	
