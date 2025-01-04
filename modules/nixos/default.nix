{ catppuccin, mlib, ... }:
_:

{
  imports =
    [
      catppuccin.nixosModules.catppuccin
    ]
    ++ (mlib.importModules [
      ../common/catppuccin.nix

      ./packages
      ./services
      ./desktop
      ./boot
    ]);
}
