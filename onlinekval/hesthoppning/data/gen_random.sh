./gen 1000 1000 1337 0.7 yes > secret/group1/secret01.in

g++ ../submissions/accepted/eo_ac.cc -o sol

for x in $(find | grep in$)
do
	./sol < $x > ${x%.in}.ans
done
