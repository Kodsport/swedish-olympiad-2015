import sys

def product(lis): 
    if not lis: return 1
    return lis[0]*product(lis[1:])
    
def fak(k,m):  
    return sum([product(range(k-i+1,k+1))*product(range(m-i,m))/product(range(1,i+1)) for i in range(1,k+1)]) + 1

org=list(sys.stdin.readline().strip())
N=int(sys.stdin.readline())
blanda=[sys.stdin.readline().strip() for i in range(N)]
dup=[(org.count(x),[len(y) for y in blanda if x in y]) for x in set(org)]
print product([fak(k,m[0]) for (k,m) in dup if m]) - 1
