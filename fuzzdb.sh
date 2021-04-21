#!/bin/bash
for (( count=1; count<2000; count++ ))
do
radamsa fuzz/$(ls fuzz/ | shuf -n1) > ../examples/test.bf
cat log.txt
timeout --preserve-status 10s brainfuck ../examples/test.bf 2>log.txt
if [[ "$?" == 143 ]]; then
  cat ../examples/test.bf > ../examples/ddos$(echo "$count").bf
fi
cat log.txt | grep -q "error\|interpreter"
if [[ "$?" == 0 ]]; then
  cat ../examples/test.bf > ../examples/error$(echo "$count").bf
fi
done
