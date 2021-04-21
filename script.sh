#!/bin/bash
for (( count=1; count<100; count++ ))
do
radamsa ../examples/hello.bf > ../examples/test.bf
timeout --preserve-status 60s brainfuck ../examples/test.bf 2>log.txt
if [[ "$?" == 143 ]]; then
  cat ../examples/test.bf > ../examples/ddos$(echo "$count").bf
fi
cat log.txt | grep -q "error"
if [[ "$?" == 0 ]]; then
  cat ../examples/test.bf > ../examples/error$(echo "$count").bf
fi
done
