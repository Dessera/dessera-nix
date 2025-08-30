inputs: self:
{ config, lib, ... }:

{
  assertions = [
    {
      assertion = lib.hasAttr "catppuccin" config;
      message = "catppuccin extension depends on catppuccin/nix, which is not found!";
    }
  ];

  imports = [
    ./gtk.nix
    ./plasma.nix
    ./gnome.nix
    ./konsole.nix
  ];
}
