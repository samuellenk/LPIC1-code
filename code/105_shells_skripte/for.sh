#!/usr/bin/env bash

echo "lange Variante mit IF"
for NUM in 1 1 2 3 5 8 13; do
  echo -n "$NUM ist "
  if [ $(( $NUM % 2 )) -eq 1 ]; then
    echo "ungerade."
  else
    echo "gerade."
  fi
done

echo "kurze Variante mit && bzw. ||"
for NUM in 1 1 2 3 5 8 13; do
  echo -n "$NUM ist " && [ $(( $NUM % 2 )) -eq 1 ] && echo "ungerade." || echo "gerade."
done
