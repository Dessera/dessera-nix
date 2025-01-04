{ catppuccin, mlib, ... }:
{ ... }:

{
  imports =
    [
      catppuccin.homeManagerModules.catppuccin
    ]
    ++ (mlib.importModules [
      ../common/catppuccin.nix

      ./desktop
      ./packages
    ]);
}
