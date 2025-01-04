{ mlib, ... }:
_:

{
  imports = mlib.importModules [
    ./plasma.nix
    ./sddm.nix
  ];
}
