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

  catppuccin.cursors.enable = true;
  home.pointerCursor.size = 25;
}
