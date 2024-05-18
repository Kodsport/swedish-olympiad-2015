#!/usr/bin/env bash

. ../../testdata_tools/gen.sh

use_solution portaler.cpp

compile gen.py

samplegroup
sample 1

group small-valid 10 # 1
limits maxN=1000 maxQ=1000 valid=yes
tc random-valid-small   gen N=1000 Q=1000 method=random  only_valid=50 seed=0  # 1a-1234567
tc path-valid-small     gen N=1000 Q=1000 method=path    only_valid=3  seed=6  # 1b-1234567
tc reverse-valid-small  gen N=1000 Q=1000 method=reverse only_valid=3  seed=9  # 1c-1234567
tc cycle-valid-small    gen N=1000 Q=1000 method=cycle   only_valid=3  seed=12 # 1d-1234567

group small-random 20 # 2
limits maxN=1000 maxQ=1000
tc 1
include_group small-valid
tc random-small gen N=1000 Q=1000 method=random only_valid=0 seed=1 # 2a-247

group medium-valid 10 # 3
limits maxN=7000 maxQ=120000 valid=yes
include_group small-valid
tc random-valid-medium  gen N=7000 Q=70000  method=random  only_valid=100 seed=2  # 3a-34567
tc path-valid-medium    gen N=7000 Q=120000 method=path    only_valid=3   seed=7  # 3b-34
tc reverse-valid-medium gen N=7000 Q=120000 method=reverse only_valid=3   seed=10 # 3c-34
tc cycle-valid-medium   gen N=7000 Q=120000 method=cycle   only_valid=3   seed=13 # 3d-34
tc path2-valid-medium   gen N=7000 Q=120000 method=path2   only_valid=0   seed=15 # 3e-34

group medium-random 10 # 4
limits maxN=7000 maxQ=120000
include_group small-random
include_group medium-valid
tc random-medium gen N=7000 Q=70000 method=random only_valid=0 seed=3 # 4a-47

group big-valid-easy 10 # 5
limits maxN=50000 maxQ=70000 valid=yes
include_group small-valid
tc random-valid-medium
tc random-valid-big gen N=50000 Q=70000 method=random only_valid=300 seed=4 # 5a-567
tc path-valid-big   gen N=50000 Q=70000 method=path   only_valid=3   seed=8 # 5b-567

group big-valid 30 # 6
limits maxN=50000 maxQ=70000 valid=yes
include_group big-valid-easy
tc random-valid-medium # this was only included in the medium groups originally
tc reverse-valid-big gen N=50000 Q=70000 method=reverse only_valid=3 seed=11 # 5c-67
tc cycle-valid-big   gen N=50000 Q=70000 method=cycle   only_valid=3 seed=14 # 5d-67

group big-random 10 # 7
limits maxN=50000 maxQ=70000
include_group small-random
include_group big-valid
tc random-valid-medium
tc random-medium
tc random-big gen N=50000 Q=70000 method=random only_valid=0 seed=5 # 7a-7
