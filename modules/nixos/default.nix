{ importModules, ... }:
{ catppuccin, ... }:
_:

{
  imports =
    [
      catppuccin.nixosModules.catppuccin
    ]
    ++ (importModules [
      ../common/catppuccin.nix

      ./packages
      ./services
      ./desktop
      ./boot
    ]);
}
