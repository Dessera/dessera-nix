{ importModules, ... }:
{ ... }:
{ ... }:

{
  imports = importModules [
    ./gtk.nix
    ./qt.nix

    ./plasma
  ];

  catppuccin.cursors.enable = true;
  home.pointerCursor.size = 25;
}
