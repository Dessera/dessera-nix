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
      ./kwin/extra
    ]);

  options.modules.desktop.plasma = {
    enable = mkEnableOption "Enable plasma configuration";
  };

  config = mkIf cfg.enable {
    modules.packages = {
      alacritty.enable = true;
    };

    programs.plasma = {
      enable = true;
      workspace = {
        wallpaper = meta.appearance.background;
        colorScheme = plasmaColorScheme;
        lookAndFeel = plasmaLookAndFeel;
        iconTheme = "Papirus-Dark";
      };
      kscreenlocker = {
        appearance.wallpaper = meta.appearance.background;
      };

      fonts = {
        general = {
          family = "Source Han Sans SC";
          pointSize = 10;
        };
        fixedWidth = {
          family = "JetBrainsMono Nerd Font Mono";
          pointSize = 10;
        };
        small = {
          family = "Source Han Sans SC";
          pointSize = 8;
        };
        toolbar = {
          family = "Source Han Sans SC";
          pointSize = 10;
        };
        menu = {
          family = "Source Han Sans SC";
          pointSize = 10;
        };
        windowTitle = {
          family = "Source Han Sans SC";
          pointSize = 10;
        };
      };

      input.keyboard = {
        numlockOnStartup = "on";
      };

      panels = import ./pannels.nix;
      hotkeys = import ./hotkeys.nix;

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
