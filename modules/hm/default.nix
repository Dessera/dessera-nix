{ importModules, ... }:
{ catppuccin, ... }:
{ ... }:

{
  imports =
    [
      catppuccin.homeManagerModules.catppuccin
    ]
    ++ (importModules [
      ../common/catppuccin.nix

      ./desktop
      ./packages
    ]);

  catppuccin.pointerCursor.enable = true;
  home.pointerCursor.size = 25;
}
