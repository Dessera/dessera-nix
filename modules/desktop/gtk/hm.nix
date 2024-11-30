_:
{ ... }:
{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.desktop.gtk;
  inherit (lib) mkEnableOption mkIf;
in
{

  options.modules.desktop.gtk = {
    enable = mkEnableOption "Enable gtk configuration";
  };

  config = mkIf cfg.enable {
    gtk = {
      enable = true;
      cursorTheme = {
        name = "Bibata_Ghost";
        package = pkgs.bibata-cursors-translucent;
        size = 25;
      };
      theme = {
        name = "catppuccin-mocha-lavender-standard";
        package = pkgs.catppuccin-gtk.override {
          accents = [ "lavender" ];
          variant = "mocha";
        };
      };
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
    };
  };
}
