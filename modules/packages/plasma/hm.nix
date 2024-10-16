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

      panels = [
        {
          location = "left";
          alignment = "center";
          lengthMode = "fit";
          hiding = "dodgewindows";
          floating = true;
          height = 50;
          screen = 0;
          widgets = [
            {
              iconTasks = {
                launchers = [
                  "applications:org.kde.dolphin.desktop"
                  "applications:org.kde.konsole.desktop"
                  "applications:clash-verge.desktop"
                  "applications:firefox.desktop"
                  "applications:code.desktop"
                ];
              };
            }
            "org.kde.plasma.marginsseparator"
            {
              kickerdash = {
                icon = "nix-snowflake-white";
              };
            }
          ];
        }
        {
          location = "top";
          floating = true;
          height = 30;
          widgets = [
            {
              applicationTitleBar = {
                behavior = {
                  activeTaskSource = "activeTask";
                };
                layout = {
                  elements = [ "windowTitle" ];
                  horizontalAlignment = "left";
                  showDisabledElements = "deactivated";
                  verticalAlignment = "center";
                };
                windowTitle = {
                  font = {
                    bold = true;
                  };
                  hideEmptyTitle = true;
                  undefinedWindowTitle = "无标题";
                  margins = {
                    bottom = 0;
                    left = 10;
                    right = 5;
                    top = 0;
                  };
                  source = "genericAppName";
                };
              };
            }
            "org.kde.plasma.appmenu"
            "org.kde.plasma.panelspacer"
            {
              digitalClock = {
                date = {
                  position = "besideTime";
                };
              };
            }
            "org.kde.plasma.panelspacer"
            {
              systemTray = {
                items = {
                  shown = [
                    "org.kde.plasma.battery"
                    "org.kde.plasma.bluetooth"
                    "org.kde.plasma.volume"
                  ];
                  hidden = [
                    "org.kde.plasma.networkmanagement"
                    "org.kde.plasma.brightness"
                    "org.kde.plasma.clipboard"
                  ];
                };
              };
            }
          ];
        }
      ];
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
