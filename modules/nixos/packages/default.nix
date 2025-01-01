{ moduleLib, ... }:
_:

{
  imports = moduleLib.importModules [
    ./git.nix
    ./fish.nix
    ./podman.nix
  ];
}
