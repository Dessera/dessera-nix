{ catppuccin, moduleLib, ... }:
_:

{
  imports =
    [
      catppuccin.nixosModules.catppuccin
    ]
    ++ (moduleLib.importModules [
      ../common/catppuccin.nix

      ./packages
      ./services
      ./desktop
      ./boot
    ]);
}
