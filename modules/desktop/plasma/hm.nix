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
          theme = "Bibata_Ghost";
          size = 25;
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

      # TODO: Should only be enabled if qt module is enabled
      configFile = {
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
