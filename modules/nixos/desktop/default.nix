{ mlib, ... }:
_:

{
  imports = mlib.importModules [
    ./plasma.nix
    ./gnome.nix
    ./sddm.nix
    ./gdm.nix
  ];
}
