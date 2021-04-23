#!/bin/bash
for (( count=1; count<1000; count++ ))
do
radamsa ../examples/$(ls ../examples | shuf -n1) > ../examples/test.bf
cat log.txt
timeout --preserve-status 30s brainfuck ../examples/test.bf 2>log.txt
if [[ "$?" == 143 ]]; then
  cat ../examples/test.bf > ../examples/ddos$(echo "$count").bf
fi
cat log.txt | grep -q "error\|interpreter"
if [[ "$?" == 0 ]]; then
  cat ../examples/test.bf > ../examples/error$(echo "$count").bf
fi
done
