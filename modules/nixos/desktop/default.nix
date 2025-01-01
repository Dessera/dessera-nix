{ moduleLib, ... }:
_:

{
  imports = moduleLib.importModules [
    ./plasma.nix
    ./sddm.nix
  ];
}
