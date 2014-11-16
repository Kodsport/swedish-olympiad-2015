def inside(a, b):
    return b[1] <= a[1] and b[0] - a[0] <= a[1] - b[1]

def get_middle(a, b):
    x = float(a[0] + a[1] + b[0] - b[1]) / 2;
    y = b[1] + x - b[0]
    return [x,y]

def cmp(a,b):
    return -1 if a[0] - a[1] < b[0] - b[1] or a[0] - a[1] == b[0] - b[1] and a[1] > b[1] else 1

def main():
    n = int(raw_input())
    p = []
    for i in range(n):
        p.append(map(int, raw_input().split()))
    p = sorted(p, cmp)
    res = 0
    li = 0
    for ri in range(1, n):
        if not inside(p[li], p[ri]):
            mid = get_middle(p[li], p[ri])
            res += p[li][1] ** 2
            if mid[1] >= 0:
                res -= mid[1] ** 2
            li = ri
    res += p[li][1] ** 2
    print res

if __name__ == "__main__":
    main()

