# Count eo.py's inner-loop iterations on existing tests vs. the theoretical maximum C(n,3).
import sys
def count(path):
    tok=open(path).read().split()
    n=int(tok[0]); d=float(tok[1])
    x=[0]*n; y=[0]*n
    for i in range(n):
        x[i]=int(tok[2+2*i]); y[i]=int(tok[3+2*i])
    dp=[-1]*n; total=[0]
    seen=set()
    stack=[0]
    # emulate rec's expansion set + inner loop cost
    order=[]
    def rec(pos):
        if pos>=n-1: return
        if pos in seen: return
        seen.add(pos)
        nxt=[]
        for i in range(pos+1,n):
            dx=x[i]-x[pos]; dy=y[i]-y[pos]
            angle=dy/dx
            if abs(angle)<=d:
                total[0]+= i-pos-1
                good=True
                for j in range(pos+1,i):
                    if angle < (y[j]-y[pos])/(x[j]-x[pos]): good=False; break
                if good: nxt.append(i)
        for i in nxt: rec(i)
    sys.setrecursionlimit(20000)
    rec(0)
    mx = n*(n-1)*(n-2)//6
    print("%-14s n=%4d inner=%11d  max=C(n,3)=%11d  %.1f%%"%(path.split('/')[-1],n,total[0],mx,100*total[0]/mx))
for p in sys.argv[1:]: count(p)
