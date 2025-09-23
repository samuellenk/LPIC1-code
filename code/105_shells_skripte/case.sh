#!/usr/bin/env bash

shopt -s nocasematch

DISTRO="$1"

echo -n "Distribution $DISTRO nutzt "
case "$DISTRO" in
  debian | ubuntu | mint)
    echo -n "das DEB";;
  rocky | redhat | opensuse )
    echo -n "das RPM";;
  *)
    echo -n "ein unbekanntes";;
esac
echo " Paketformat."
