{ importModules, ... }:
_: _:

{
  imports = importModules [
    ./grub.nix
    ./plymouth.nix
  ];
}
