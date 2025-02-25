{ pkgs, ... }:
let
  fontOpt = import ../../common/font.nix pkgs;
in
{
  modules.desktop = {
    gtk.enable = true;
    gnome.enable = true;
    qt.enable = true;
  };
}
