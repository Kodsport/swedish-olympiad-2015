import sys

def product(list):
    p = 1
    for i in list:
        p *= i
    return p

def fak(k,mm):
    s=0
    for i in range(1<<k):
        f=1
        m=mm
        for p in range(k):
            if (i>>p) & 1 == 1:
                f*=m-1
                m-=1
        s+=f
    return s

org=list(sys.stdin.readline().strip())
N=int(sys.stdin.readline())
blanda=[x.strip() for x in sys.stdin.readlines()]

dup={}
n=0
for x in org:
    for b in blanda:
        if x in b:
            n+=1
            if x in dup:
                (k,m)=dup[x]
                dup[x]=(k+1,m)
            else:
                dup[x]=(1,len(b))
            break

print product([fak(k,m) for (k,m) in dup.values()])-1
