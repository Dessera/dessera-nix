# list all tasks
help:
  @just --list

# build and switch to new profile
mkos:
  sudo nixos-rebuild switch

# build and test new profile
dbgos:
  sudo nixos-rebuild test
