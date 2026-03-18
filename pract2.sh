#!/bin/bash

for i in {1..100}
do
  if (( i % 3 == 0 && i % 5 == 0 ))
  then
    echo "$i is divisible by both 3 and 5"
  fi
done
