import random,sys
mode=sys.argv[1]; seed=int(sys.argv[2]); n=1000
random.seed(seed)
X=1000
if mode=='convex':          # slopes strictly increasing -> every chord good, `good` never flips
    c=(n-1)//2; A=8
    f=lambda i: i*(i-1)//2 - c*i
    lo=min(f(i) for i in range(n))
    ys=[A*(f(i)-lo) for i in range(n)]
    d=3.99
elif mode=='band':          # random y in a narrow band -> every chord within d, `good` flips a lot
    ys=[random.randint(0,999) for _ in range(n)]
    d=1.0
elif mode=='bandwide':      # same idea, y spanning the full 1e6 range
    ys=[random.randint(0,999999) for _ in range(n)]
    d=1000.0
elif mode=='sawband':       # adversarial alternation at the band edges
    ys=[999 if i%2 else 0 for i in range(n)]
    d=1.0
print(n,d)
for i in range(n): print(i*X, ys[i])
