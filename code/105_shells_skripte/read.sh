#!/usr/bin/env bash

## Variante 1:
echo -n "Bitte Namen und Alter angeben: "
read NAME ALTER
echo "Name: $NAME"
echo "Alter: $ALTER"

## Variante 2:
read -p "Bitte Namen und Alter angeben: " NAME ALTER
echo "Name: $NAME"
echo "Alter: $ALTER"
