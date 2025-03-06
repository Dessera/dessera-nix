{ mlib, ... }:
{ ... }:

{
  imports = mlib.importModules [
    ./gtk.nix
    ./qt.nix

    ./plasma
    ./gnome
    ./catppuccin-extra
  ];
}
