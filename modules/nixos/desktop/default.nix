{ importModules, ... }:
_: _:

{
  imports = importModules [
    ./plasma.nix
    ./sddm.nix
  ];
}
