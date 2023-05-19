#!/bin/bash

# creating zero size file
touch test.txt

#genarting random number

for ((i=0;i<10;i++))
do
echo $((RANDOM % 10)) >> test.txt
done
