#!/bin/bash
for (( count=1; 2>1; count++ ))
do
radamsa ../examples/pocs/$(echo "$count").bf > ../examples/test.bf
echo "
POC:
" >> full_log.txt
cat ../examples/test.bf >> full_log.txt
timeout --preserve-status 10s brainfuck ../examples/test.bf 2>temp_log.txt
if [[ "$?" == 143 ]]; then
  cat ../examples/test.bf > ../examples/ddos$(echo "$count").bf
fi
cat temp_log.txt | grep -q "error\|interpreter"
if [[ "$?" == 0 ]]; then
  cat ../examples/test.bf > ../examples/error$(echo "$count").bf
fi
echo "
Errors:
" >> full_log.txt
cat temp_log.txt >> full_log.txt
done
