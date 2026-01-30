{ config, lib, ... }:

let
  inherit (lib) types;
  inherit (config.home) dockApps;
in
{
  options.home.dockApps = lib.mkOption {
    type = types.listOf types.str;
    default = [
      "applications:systemsettings.desktop"
      "applications:org.kde.dolphin.desktop"
      "applications:org.kde.plasma-systemmonitor.desktop"
    ];
  };

  config.programs.plasma.panels = [
    {
      location = "top";
      floating = false;
      hiding = "none";
      lengthMode = "fill";
      height = 40;
      screen = 0;
      widgets = [
        {
          kicker = {
            icon = "nix-snowflake";
          };
        }
        {
          applicationTitleBar = {
            behavior = {
              activeTaskSource = "activeTask";
            };
            layout = {
              elements = [
                "windowCloseButton"
                "windowMaximizeButton"
                "windowMinimizeButton"
                "windowTitle"
              ];
              horizontalAlignment = "left";
              showDisabledElements = "deactivated";
              verticalAlignment = "center";
            };
            windowTitle = {
              font.bold = true;
              hideEmptyTitle = true;
              undefinedWindowTitle = "Blank";
              margins = {
                bottom = 0;
                left = 10;
                right = 5;
                top = 0;
              };
              source = "appName";
            };
          };
        }
        {
          plasmusicToolbar = {
            settings = {
              General = {
                showWhenNoMedia = true;
                noMediaText = "";
              };
            };
          };
        }
        {
          panelSpacer = { };
        }
        {
          digitalClock = {
            date = {
              enable = true;
              position = "besideTime";
              format = "isoDate";
            };
            calendar = {
              showWeekNumbers = true;
              plugins = [ "holidaysevents" ];
            };
          };
        }
        {
          panelSpacer = { };
        }
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
    {
      location = "bottom";
      floating = true;
      hiding = "dodgewindows";
      lengthMode = "fit";
      height = 64;
      screen = 0;
      widgets = [
        {
          iconTasks = {
            launchers = dockApps;
            appearance.iconSpacing = "small";
          };
        }
      ];
    }
  ];
}
