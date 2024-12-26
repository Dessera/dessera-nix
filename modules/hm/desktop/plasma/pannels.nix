[
  {
    location = "top";
    floating = true;
    height = 38;
    screen = 0;
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
  {
    location = "bottom";
    alignment = "center";
    lengthMode = "fit";
    hiding = "dodgewindows";
    floating = true;
    height = 58;
    screen = 0;
    widgets = [
      {
        iconTasks = {
          launchers = [
            "applications:org.kde.dolphin.desktop"
            "applications:Alacritty.desktop"
            "applications:nixcode.desktop"
            "applications:firefox.desktop"
            "applications:org.kde.spectacle.desktop"
            "applications:systemsettings.desktop"
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
]
