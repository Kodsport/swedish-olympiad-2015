#!/usr/bin/python3

def simulate(order, hole):
    inHole = order[-hole:]

    return inHole[::-1] + order[:-hole]


n = int(input())
order = [*map(int,input().split())]

for h1 in range(1,n):
    for h2 in range(1,n):
        for h3 in range(1,n):
            currOrder = [*range(1,n+1)][::-1]

            currOrder = simulate(currOrder, h1)
            currOrder = simulate(currOrder, h2)
            currOrder = simulate(currOrder, h3)

            if currOrder == order:
                print(h1,h2,h3)


