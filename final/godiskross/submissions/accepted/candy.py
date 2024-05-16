#!/usr/bin/python3

import sys,copy

cnt=0
cnt2=0

def score(s,R,org,depth):
    if(depth>30):
        print("Error: depth>30")
        sys.exit(0)
    global cnt2
    cnt2+=1
    points=0
    k=0
    remlist=[]
    while k<R:
        j=k+1
        while j<R and s[j]==s[k] : j+=1
        if j-k >= 3:
            points+=(j-k)*2-5
            remlist.append((k,j))
        k=j
    if len(remlist)==0: return points,s
    else:
        ss=s[:]
        for (a,b) in remlist.__reversed__(): del ss[a:b]
        if(len(ss)<R): ss+=org
        p,ss=score(ss,R,org,depth+1)
        return points+p,ss
    
def MLX(map,n,R,org):  # n moves left
    if n==0: return 0
    global cnt
    cnt+=1
    s=map[:]
    #print "".join(s[:R])
    ma=0
    for j in range(R-1):
        s[j],s[j+1]=s[j+1],s[j]
        p,ss = score(s, R, org,0)
        if p>0: ma=max(ma, p+MLX(ss,n-1,R,org))
        s[j],s[j+1]=s[j+1],s[j]
    return ma

N=int(sys.stdin.readline())
org=list(sys.stdin.readline().strip())
print(MLX(org,N,len(org),org))
#print "Cnt: ", cnt, cnt2
