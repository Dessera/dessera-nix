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
}
