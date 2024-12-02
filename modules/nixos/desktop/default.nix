{ importModules, ... }:
_: _:

{
  imports = importModules [
    ./plasma.nix
    ./sddm.nix
    ./plymouth.nix
    ./grub.nix
  ];
}
