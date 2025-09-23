#!/usr/bin/env bash

NUMS=( "$(seq 3 5 28)" )

echo "# advanced For-Loop"
for (( i=0 ; i < "${#NUMS[@]}" ; i++ )); do
  echo "$i=${NUMS[$i]}"
done

echo "# While-Loop"
i=0
while [ "$i" -lt "${#NUMS[@]}" ]; do
  echo "$i=${NUMS[$i]}"
  i=$(( "$i" + 1 ))
done
