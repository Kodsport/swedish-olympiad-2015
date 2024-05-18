import sys
import random

def main(argv):
    if len(argv) != 7:
        print("Usage: script.py min_n k max_t max_group_size max_duplicate seed")
        return

    min_n, k, max_t, max_group_size, max_duplicate, seed = map(int, argv[1:])
    random.seed(seed)

    def assert_condition(condition):
        if not condition:
            print("Assertion failed yao!")
            sys.exit(1)

    # resulting n will be at least min_n, and in practice around
    # (min_n + max_group_size/2) * (max_duplicate/2 + 1)
    n = min_n
    t = 0
    arrivals = []

    while n > 0:
        t += random.randint(0, k*20) if random.random() > 0.7 else random.randint(0, k*1)
        t %= max_t - (4 * k)  # I wanted just max_t, but we are comforty here
        t = max(0, t)
        group_size = random.randint(0, max_group_size)
        for _ in range(group_size):
            arrival_time = t + random.randint(1, 2*k) + 1
            duplicates = [arrival_time] * (random.randint(1, max_duplicate) + 1)
            arrivals.extend(duplicates)
        n -= group_size

    random.shuffle(arrivals)
    while len(arrivals) > min_n:
        del arrivals[-1]
    # arrivals.sort() # TODO remove

    print(f"{len(arrivals)} {k}")
    print(" ".join(map(str, arrivals)))

if __name__ == "__main__":
    main(sys.argv)
