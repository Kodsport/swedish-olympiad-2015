#!/usr/bin/python3
import sys
import random

def cmdlinearg(name, default=None):
    for arg in sys.argv:
        if arg.startswith(name + "="):
            return arg.split("=")[1]
    assert default is not None, name
    return default

def main():
    seed = int(cmdlinearg("seed"))
    extra_ms = int(cmdlinearg("extra_ms"))  # 200 for easy case, 0 for hard
    random.seed(seed)

    n = random.randrange(1, 1000, 1)

    print(n)

    timestamps = [300]

    for i in range(n):
        d_timestamp = random.randrange(1, 200, 1) + extra_ms
        for j in range(-1, -len(timestamps), -1):
            if timestamps[j] < timestamps[-1] + d_timestamp - 200: 
                break
            if timestamps[j] == timestamps[-1] + d_timestamp - 100:
                d_timestamp = 101
                break
        timestamps.append(timestamps[-1] + d_timestamp)
        device = random.choice(('mobile', 'laptop'))
        action = random.choice(('play', 'paus'))
        if i == n-1:
          action = 'paus'
        timestamp_str = str(timestamps[-1]).rjust(7, '0')
        line = '{0} {1} {2}'.format(timestamp_str, device, action)
        print(line)

main()
