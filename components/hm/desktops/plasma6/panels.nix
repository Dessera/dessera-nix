{
  programs.plasma.panels = [
    {
      location = "top";
      floating = false;
      hiding = "dodgewindows";
      height = 36;
      screen = 0;
      widgets = [
        {
          kickoff = {
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
              undefinedWindowTitle = "无标题";
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
        "org.kde.plasma.appmenu"
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
        {
          digitalClock = {
            date = {
              enable = false;
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
      height = 44;
      screen = 0;
      widgets = [
        {
          iconTasks = {
            launchers = [
              "applications:org.kde.dolphin.desktop"
              "applications:org.wezfurlong.wezterm.desktop"
              "applications:code.desktop"
              "applications:firefox.desktop"
              "applications:qq.desktop"
            ];
            appearance.iconSpacing = "small";
          };
        }
      ];
    }
  ];
}
