import random

s = int(input())
random.seed(s)	
n = random.randint(10, 50)
m = random.randint(100, 1000)
r = random.randint(100, 1000)	
a = []
for i in range(n):
	a.append(str(random.random()*360))
print ' '.join([str(n), str(m), str(r)])	
print ' '.join(a)	
