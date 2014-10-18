#!/bin/bash
for x in {01..05}
do
  ./gen.py $x 200 > "secret/g1/spotifyconnect_${x}.in"
done

for x in {06..10}
do
  ./gen.py $x   0 > "secret/g2/spotifyconnect_${x}.in"
done

for x in $(find | grep in$)
do
	../submissions/accepted/arash.py < $x > ${x%.in}.ans
done
