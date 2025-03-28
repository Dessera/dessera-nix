_:
{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;
  inherit (config.catppuccin) flavor accent;

  cfg = config.gtk.catppuccin-extra;
  homeCursorCfg = config.home.pointerCursor;
in
{
  options.gtk.catppuccin-extra = {
    enable = mkEnableOption "Enable catppuccin-extra gtk configuration";
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

      # gtk does not use home.pointerCursor
      # set it to the same value as the cursor theme
    };

    home.pointerCursor.gtk.enable = true;
  };
}
