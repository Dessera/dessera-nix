{ importModules, ... }:
{ ... }:
{ ... }:

{
  imports = importModules [
    ./gtk.nix
    ./qt.nix

    ./plasma
  ];

  catppuccin.pointerCursor.enable = true;
  home.pointerCursor.size = 25;
}
