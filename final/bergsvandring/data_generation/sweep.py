import sys
n=1000; X=1000
B=int(sys.argv[1])          # y-band width: controls rounding noise vs curvature
STEEP=int(sys.argv[2])      # 1 = add steep first/last segment so the answer is non-zero
c=(n-1)/2.0
body=[round(B*((i-c)/c)**2) for i in range(n)]
if STEEP:
    lo,hi=1,n-2
    ys=[0]*n
    for i in range(lo,hi+1): ys[i]=body[i]
    ys[0]=ys[1]+1600           # slope -1.6 over dx=1000  (too steep for d=1.5)
    ys[n-1]=ys[n-2]+1600       # slope +1.6
    d=1.5
else:
    ys=body[:]; d=1.5
print(n,d)
for i in range(n): print(i*X, ys[i])
