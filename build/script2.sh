#!/bin/bash
for (( count=1; count<100; count++ ))
do
filename ../examples/hello.bf | radamsa > filename.txt; echo -n ".bf" >> filename.txt
cat ../examples/hello.bf > $(cat filename.txt | tr -d "\n")
timeout --preserve-status 60s brainfuck $(cat filename.txt | tr -d "\n") 2>log.txt
done
