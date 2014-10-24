./gen 45234 5 5 1 > secret/same_group_50/random_5_5.in
./gen 35474 5 10 1 > secret/same_group_50/random_5_10.in
./gen 81240 5 15 1 > secret/same_group_50/random_5_15.in
./gen 92837 10 5 1 > secret/same_group_50/random_10_5.in
./gen 12354 10 10 1 > secret/same_group_50/random_10_10.in
./gen 28953 10 15 1 > secret/same_group_50/random_10_15.in
./gen 23435 15 5 1 > secret/same_group_50/random_15_5.in
./gen 24584 15 10 1 > secret/same_group_50/random_15_10.in
./gen 91754 15 15 1 > secret/same_group_50/random_15_15.in


./gen 45234 5 5 0 > secret/different_group_50/random_5_5.in
./gen 35474 5 10 0 > secret/different_group_50/random_5_10.in
./gen 81240 5 15 0 > secret/different_group_50/random_5_15.in
./gen 92837 10 5 0 > secret/different_group_50/random_10_5.in
./gen 12354 10 10 0 > secret/different_group_50/random_10_10.in
./gen 28953 10 15 0 > secret/different_group_50/random_10_15.in
./gen 23435 15 5 0 > secret/different_group_50/random_15_5.in
./gen 24584 15 10 0 > secret/different_group_50/random_15_10.in
./gen 91754 15 15 0 > secret/different_group_50/random_15_15.in


g++ ../submissions/accepted/apples_eo.cpp -o sol

for x in $(find | grep in$)
do
	./sol < $x > ${x%.in}.ans
done
