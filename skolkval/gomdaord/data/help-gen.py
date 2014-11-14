import sys

# To make it easier to generate test data
# 
#    $ echo 'HEJ' | python data/help-gen.py
#    HZYXWVUTEZYXWJ
#

line = sys.stdin.readline().strip()

line_out = []
for i in range(len(line)):
    c = line[i]
    line_out += [c]
    if i < len(line) - 1:
        for j in range(ord(c) - ord('A')):
            line_out += chr(ord('Z') - j)

print(''.join(line_out))
