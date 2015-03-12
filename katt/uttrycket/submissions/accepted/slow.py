import sys

s=sys.stdin.readline().strip()

op=[x for x in list(s) if x=='+' or x=='*' or x=='-']
term=[int(x) for x in s.replace('+','*').replace('-','*').split('*')]
assert len(op)==len(term)-1
pre={}

def calc(a,b):
    if a==b: return (term[a],)
    if not (a,b) in pre:
        res=[]
        for i in range(a,b):
            for t1 in calc(a,i):
                for t2 in calc(i+1,b):
                    if op[i]=='*':
                        r=t1*t2
                    elif op[i]=='+':
                        r=t1+t2
                    else:
                        r=t1-t2
                    res.append(r)
        pre[(a,b)]=(max(res),min(res))
    return pre[(a,b)]

print calc(0,len(op))[0]
