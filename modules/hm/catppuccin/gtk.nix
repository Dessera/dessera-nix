{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;
  inherit (config.catppuccin) flavor accent;

  cfg = config.gtk.catppuccin-ext;
in
{
  options.gtk.catppuccin-ext = {
    enable = mkEnableOption "Enable catppuccin gtk configuration";
  };

  config = mkIf cfg.enable {
    gtk = {
      theme = {
        name = "catppuccin-${flavor}-${accent}-standard";
        package = pkgs.catppuccin-gtk.override {
          variant = flavor;
          accents = [ accent ];
        };
      };

      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };
    };

    home.pointerCursor.gtk.enable = true;
  };
}
