#!/usr/bin/env bash

NUMS=( "$(seq 3 5 28)" )

#echo "Array: ${NUMS[@]}"

echo "# simpler For-Loop"
for i in "${NUMS[@]}"; do
  echo "i=$i"
done

echo "# advanced For-Loop"
for (( i = 0 ; i < "${#NUMS[@]}" ; i++ )); do
  echo "$i=${NUMS[i]}"
done

echo "# advanced REVERSED For-Loop"
#for (( i = ${#NUMS[@]} - 1; i >= 0; i-- )); do
for (( i = "${#NUMS[@]}" - 1; i >= 0 ; i-- )); do
  echo "$i=${NUMS[i]}"
done

