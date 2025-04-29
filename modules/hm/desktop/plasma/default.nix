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
    mkMerge
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
      ./panels.nix
      ./extra
    ]);

  options.modules.desktop.plasma = {
    enable = mkEnableOption "Enable plasma configuration";

    inputMethod = mkOption {
      type = types.str;
      default = "/run/current-system/sw/share/applications/fcitx5-wayland-launcher.desktop";
      description = "Input method used in wayland";
    };

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

    dockApplications = mkOption {
      type = types.listOf types.str;
      default = [ ];
      description = "Applications to display in dock";
    };

    effects = {
      blur = {
        enable = mkEnableOption "Enable blur effect";
        exclude = mkOption {
          type = types.listOf types.str;
          default = [ ];
          description = "Exclude applications from blur effect";
        };
        strength = mkOption {
          type = types.int;
          default = 8;
          description = "Blur strength";
        };
      };

      transparent = {
        enable = mkEnableOption "Enable transparent background";
        exclude = mkOption {
          type = types.listOf types.str;
          default = [ ];
          description = "Exclude applications from transparent background";
        };
        activeOpacity = mkOption {
          type = types.int;
          default = 85;
          description = "Opacity of transparent background";
        };
        inactiveOpacity = mkOption {
          type = types.int;
          default = 85;
          description = "Opacity of inactive transparent background";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    programs.plasma = {
      enable = true;
      catppuccin-extra.enable = true;

      workspace.wallpaper = wallpaperPath;
      kscreenlocker.appearance.wallpaper = wallpaperPath;

      input.keyboard = {
        numlockOnStartup = "on";
      };

      hotkeys.commands = {
        terminal = {
          command = cfg.defaultApplications.terminal.application;
          comment = "Run terminal";
          key = "Ctrl+Alt+T";
        };
      };

      window-rules = mkMerge [
        (mkIf cfg.effects.transparent.enable [
          (import ./window-rules/transparent.nix cfg.effects.transparent)
        ])
      ];

      kwin.effects = {
        shakeCursor.enable = true;
        dimAdminMode.enable = true;

        windowOpenClose.animation = "fade";
        minimization.animation = "squash";

        blurplus = {
          enable = cfg.effects.blur.enable;
          windowClasses = lib.concatStringsSep "\n" cfg.effects.blur.exclude;
          blurStrength = cfg.effects.blur.strength;
        };
      };

      configFile = {
        kdeglobals.General = {
          TerminalApplication = cfg.defaultApplications.terminal.application;
          TerminalService = cfg.defaultApplications.terminal.service;
        };

        kwinrc.Wayland.InputMethod = cfg.inputMethod;
      };
    };
  };
}
