# list all tasks
help:
  @just --list

# build and switch to new profile
mkos:
  sudo nixos-rebuild switch