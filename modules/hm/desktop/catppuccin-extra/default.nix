{ mlib, ... }:
{
  imports = mlib.importModules [
    ./gtk.nix
    ./plasma.nix

    ./konsole
  ];
}
