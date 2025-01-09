{ mlib, ... }:
{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (config.catppuccin) flavor accent;
  inherit (mlib) toUpperInitial;

  cfg = config.programs.plasma.catppuccin-extra;

  colorScheme = "Catppuccin${toUpperInitial flavor}${toUpperInitial accent}";
  lookAndFeel = "Catppuccin-${flavor}-${accent}";
  splashScreen = "Catppuccin-${toUpperInitial flavor}-${toUpperInitial accent}";
in
{
  options.programs.plasma.catppuccin-extra = {
    enable = lib.mkEnableOption "Enable Catppuccin extra configuration for Plasma";
  };

  config = lib.mkIf cfg.enable {
    programs.plasma.workspace = {
      inherit colorScheme lookAndFeel;
      splashScreen = {
        engine = "KSplashQML";
        theme = splashScreen;
      };

      iconTheme = "Papirus-Dark";
    };

    home.packages = with pkgs; [
      (catppuccin-kde.override {
        flavour = [ flavor ];
        accents = [ accent ];
      })

      papirus-icon-theme
    ];
  };
}
