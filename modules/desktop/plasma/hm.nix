{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.desktop.plasma;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.desktop.plasma = {
    enable = mkEnableOption "Enable plasma configuration";
  };

  config = mkIf cfg.enable {

    programs.konsole = {
      enable = true;
      defaultProfile = "default";
      profiles = {
        default = {
          font = {
            size = 16;
          };
        };
      };
    };

    programs.plasma = {
      enable = true;
      workspace = {
        wallpaper = ./background.png;
        colorScheme = "CatppuccinMochaLavender";
        lookAndFeel = "Catppuccin-Mocha-Lavender";
        cursor = {
          theme = "catppuccin-mocha-lavender-cursors";
          size = 20;
        };
        iconTheme = "Papirus-Dark";
      };
      kscreenlocker = {
        appearance.wallpaper = ./background.png;
      };
      panels = [
        (import ./pannels/dock.nix)
        (import ./pannels/app-menu.nix)
      ];
    };

    home.packages = with pkgs; [
      (catppuccin-kde.override {
        flavour = [ "mocha" ];
        accents = [ "lavender" ];
      })
      papirus-icon-theme
      catppuccin-cursors.mochaLavender
    ];
  };
}
