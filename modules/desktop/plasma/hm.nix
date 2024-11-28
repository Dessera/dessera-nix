{
  config,
  lib,
  pkgs,
  meta,
  ...
}:

let
  cfg = config.modules.desktop.plasma;
  qtCfg = config.modules.desktop.qt;
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
        # wallpaper = ./background.png;
        wallpaper = meta.appearance.background;
        colorScheme = "CatppuccinMochaLavender";
        lookAndFeel = "Catppuccin-Mocha-Lavender";
        cursor = {
          theme = "Bibata_Ghost";
          size = 25;
        };
        iconTheme = "Papirus-Dark";
      };
      kscreenlocker = {
        # appearance.wallpaper = ./background.png;
        appearance.wallpaper = meta.appearance.background;
      };
      panels = [
        (import ./pannels/dock.nix)
        (import ./pannels/app-menu.nix)
      ];

      configFile = mkIf qtCfg.enable {
        kdeglobals.KDE.widgetsStyle = {
          value = "kvantum-dark";
        };
      };
    };

    home.packages = with pkgs; [
      (catppuccin-kde.override {
        flavour = [ "mocha" ];
        accents = [ "lavender" ];
      })

      papirus-icon-theme
      bibata-cursors-translucent
    ];
  };
}
