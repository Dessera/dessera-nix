{ importModules, ... }:
{
  meta,
  plasma-manager,
  ...
}:
{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.desktop.plasma;
  inherit (lib) mkEnableOption mkIf toUpper;

  themeCfg = {
    inherit (meta.appearance) flavor accent;
  };

  plasmaColorScheme = "Catppuccin${toUpper themeCfg.flavor}${toUpper themeCfg.accent}";
  plasmaLookAndFeel = "Catppuccin-${themeCfg.flavor}-${themeCfg.accent}";
in
{
  imports =
    [
      plasma-manager.homeManagerModules.plasma-manager
    ]
    ++ (importModules [
      ./kwin/effects/extra
    ]);

  options.modules.desktop.plasma = {
    enable = mkEnableOption "Enable plasma configuration";
  };

  config = mkIf cfg.enable {

    programs.konsole = {
      enable = true;
      defaultProfile = "default";
      profiles = {
        default = {
          colorScheme = "catppuccin-mocha";
          font = {
            size = 16;
          };
        };
      };
    };

    # TODO: Should be a package
    xdg.dataFile."konsole/catppuccin-mocha.colorscheme".source = ./catppuccin-mocha.colorscheme;

    programs.plasma = {
      enable = true;
      overrideConfig = true;
      workspace = {
        wallpaper = meta.appearance.background;
        colorScheme = plasmaColorScheme;
        lookAndFeel = plasmaLookAndFeel;
        iconTheme = "Papirus-Dark";
      };
      kscreenlocker = {
        appearance.wallpaper = meta.appearance.background;
      };

      panels = import ./pannels;
      window-rules = import ./window-rules;

      kwin = import ./kwin;
    };

    home.packages = with pkgs; [
      (catppuccin-kde.override {
        flavour = [ themeCfg.flavor ];
        accents = [ themeCfg.accent ];
      })

      papirus-icon-theme
    ];
  };
}
