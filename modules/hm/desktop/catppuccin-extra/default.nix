{ mlib, ... }:
{
  imports = mlib.importModules [
    ./gtk.nix
    ./plasma.nix
    ./gnome.nix

    ./konsole
  ];
}
