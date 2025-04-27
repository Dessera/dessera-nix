{ catppuccin, mlib, ... }:
{ ... }:

{
  imports =
    [
      catppuccin.homeModules.catppuccin
    ]
    ++ (mlib.importModules [
      ../common/catppuccin.nix

      ./desktop
      ./packages
    ]);
}
