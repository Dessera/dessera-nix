{
  meta,
  plasma-manager,
  mlib,
  ...
}:
{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.desktop.plasma;
  inherit (lib)
    mkOption
    mkEnableOption
    mkIf
    types
    ;

  wallpaperPath = mlib.mkImage meta.appearance.background;
in
{
  imports =
    [
      plasma-manager.homeManagerModules.plasma-manager
    ]
    ++ (mlib.importModules [
      ./extras
    ]);

  options.modules.desktop.plasma = {
    enable = mkEnableOption "Enable plasma configuration";

    defaultApplications = {
      terminal = {
        application = mkOption {
          type = types.str;
          default = "konsole";
          description = "Default terminal application";
        };
        service = mkOption {
          type = types.str;
          default = "org.kde.konsole";
          description = "Default terminal service";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    programs.plasma = {
      enable = true;
      catppuccin-extra.enable = true;

      workspace = {
        wallpaper = wallpaperPath;
      };
      kscreenlocker = {
        appearance.wallpaper = wallpaperPath;
      };

      fonts = {
        general = {
          family = "Source Han Sans SC";
          pointSize = 10;
        };
        fixedWidth = {
          family = "MonaspiceNe Nerd Font Mono";
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
      kwin.effects = {
        shakeCursor.enable = true;
        dimAdminMode.enable = true;

        windowOpenClose.animation = "fade";
        minimization.animation = "squash";

        blurplus.enable = true;
      };

      configFile = {
        kdeglobals.General = {
          TerminalApplication = cfg.defaultApplications.terminal.application;
          TerminalService = cfg.defaultApplications.terminal.service;
        };

        kwinrc.Wayland.InputMethod = "/run/current-system/sw/share/applications/fcitx5-wayland-launcher.desktop";
      };
    };
  };
}
