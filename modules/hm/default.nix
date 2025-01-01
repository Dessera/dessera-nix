{ catppuccin, moduleLib, ... }:
{ ... }:

{
  imports =
    [
      catppuccin.homeManagerModules.catppuccin
    ]
    ++ (moduleLib.importModules [
      ../common/catppuccin.nix

      ./desktop
      ./packages
    ]);
}
