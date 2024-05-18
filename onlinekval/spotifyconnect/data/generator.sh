#!/usr/bin/env bash

. ../../testdata_tools/gen.sh

use_solution arash_ac.py

compile gen.py

samplegroup
sample 1

group g1 50
limits mindist=200
include_group sample
for x in {1..10}
do
  tc g1_${x} gen seed=$x extra_ms=200
done

group g2 50
include_group g1
for x in {1..10}
do
  tc g2_${x} gen seed=$((10 + $x)) extra_ms=0
done
