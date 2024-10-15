{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.packages.plasma;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.packages.plasma = {
    enable = mkEnableOption "Enable plasma configuration";
  };

  config = mkIf cfg.enable {
    programs.plasma = {
      enable = true;

      workspace = {
        wallpaper = ./background.jpg;
        lookAndFeel = "Catppuccin-Mocha-Flamingo";
        colorScheme = "CatppuccinMochaFlamingo";
        cursor = {
          theme = "Bibata-Modern-Ice";
          size = 24;
        };
      };
    };

    home.packages = with pkgs; [
      bibata-cursors
      (catppuccin-kde.override {
        flavour = [ "mocha" ];
        accents = [ "flamingo" ];
      })
    ];
  };
}
