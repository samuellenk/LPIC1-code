#!/usr/bin/env bash

release_file="/etc/os-release"
if grep -i -E -q 'Fedora|Redhat' "$release_file"; then
  sudo dnf -y check-upgrade && \
  sudo dnf -y upgrade && \
  sudo dnf -y autoremove
elif grep -i -E -q 'Debian|Mint' "$release_file"; then
  sudo apt -y update && \
  sudo apt -y upgrade && \
  sudo apt -y autoremove
fi
