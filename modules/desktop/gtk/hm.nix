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
        name = "catppuccin-mocha-lavender-cursors";
        package = pkgs.catppuccin-cursors.mochaLavender;
        size = 20;
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
