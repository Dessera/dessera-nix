{ importModules, ... }:
_: _:

{
  imports = importModules [
    ./git.nix
    ./fish.nix
    ./podman.nix
  ];
}
