{ mlib, ... }:
{ ... }:

{
  imports = mlib.importModules [
    ./gtk.nix
    ./qt.nix

    ./plasma
    ./catppuccin-extra
  ];

  catppuccin.cursors.enable = true;
  home.pointerCursor.size = 25;
}
