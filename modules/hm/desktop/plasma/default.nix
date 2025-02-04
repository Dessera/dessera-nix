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
      (mlib.mkAliasOptionModule [ "modules" "desktop" "plasma" "fonts" ] [ "programs" "plasma" "fonts" ])
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

      input.keyboard = {
        numlockOnStartup = "on";
      };

      panels = import ./pannels.nix;
      hotkeys = {
        commands = {
          terminal = {
            command = cfg.defaultApplications.terminal.application;
            comment = "Run terminal";
            key = "Ctrl+Alt+T";
          };
        };
      };

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
