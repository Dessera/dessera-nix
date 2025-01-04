{ mlib, ... }:
_:

{
  imports = mlib.importModules [
    ./git.nix
    ./fish.nix
    ./podman.nix
  ];
}
