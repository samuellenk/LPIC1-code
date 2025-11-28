#!/usr/bin/env bash

EXE="$1"

if [ -x "$EXE" ]; then
  echo "$EXE ist ausführbar"
elif [ -d "$EXE" ]; then
  echo "$EXE ist ein Ordner"
elif [ -L "$EXE" ] || [ -f "$EXE" ]; then
  echo "$EXE ist ein Link oder File"
else
  echo "Typ von $EXE ist unbekannt"
fi
