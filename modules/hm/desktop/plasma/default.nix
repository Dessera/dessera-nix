_:
{ meta, plasma-manager, ... }:
{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.desktop.plasma;
  qtCfg = config.modules.desktop.qt;
  inherit (lib) mkEnableOption mkIf;
in
{
  imports = [
    plasma-manager.homeManagerModules.plasma-manager
  ];

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
        wallpaper = meta.appearance.background;
        colorScheme = "CatppuccinMochaMauve";
        lookAndFeel = "Catppuccin-Mocha-Mauve";
        iconTheme = "Papirus-Dark";
      };
      kscreenlocker = {
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
        accents = [ "mauve" ];
      })

      papirus-icon-theme
    ];
  };
}
