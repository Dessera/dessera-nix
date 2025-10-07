# list all tasks
help:
  @just --list

# build and switch to new profile
switch:
  sudo nixos-rebuild switch

# build and switch to new profile when reboot
boot:
  sudo nixos-rebuild boot

# build and test new profile
test:
  sudo nixos-rebuild test

# Update inputs
update:
  nix flake update
