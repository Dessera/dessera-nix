{ pkgs, lib, ... }:

let
  fontOpt = import ../font.nix pkgs;
  defaultFonts = lib.mapAttrs (_: v: [ v ]) fontOpt.defaultFonts;
in
{
  fonts = {
    inherit (fontOpt) packages;

    enableDefaultPackages = true;
    fontDir.enable = true;

    fontconfig = {
      inherit defaultFonts;
      enable = true;
      cache32Bit = true;
    };
  };
}
