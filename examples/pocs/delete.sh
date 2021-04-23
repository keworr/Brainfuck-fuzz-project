#!/bin/bash
for (( count=5401; 2>1; count++ ))
do
rm $(echo "$count").bf
done
