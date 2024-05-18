#!/usr/bin/python3
import re
import sys

def main():
    time_regex = "\d" * 7
    device_regex = "(laptop|mobile)"
    action_regex = "(play|paus)"
    line_regex = "^" + " ".join((time_regex, device_regex, action_regex))  + "$"

    int_regex = "(0|[1-9][0-9]*)"
    line = sys.stdin.readline()
    assert re.match(int_regex, line)
    n = int(line)

    assert 1 <= n < 1000

    seen = set()

    last_timestamp = -101
    for i_line in range(n):
        line = sys.stdin.readline()
        assert re.match(line_regex, line)
        timestamp = int(line.split()[0])
        assert timestamp > last_timestamp and timestamp - last_timestamp != 100
        assert timestamp-100 not in seen
        seen.add(timestamp)
        last_timestamp = timestamp
        if i_line == n-1:
            assert line.split()[2] == 'paus'

    line = sys.stdin.readline()
    assert len(line) == 0

    sys.exit(42)

main()
