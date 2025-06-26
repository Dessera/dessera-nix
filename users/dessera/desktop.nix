{
  programs.plasma = {
    input.keyboard.numlockOnStartup = "on";

    window-rules = [
      (import ./window-rules/transparent.nix {
        exclude = [ ];
        activeOpacity = 80;
        inactiveOpacity = 80;
      })
    ];

    kwin.effects = {
      shakeCursor.enable = true;
      dimAdminMode.enable = true;

      windowOpenClose.animation = "fade";
      minimization.animation = "squash";

      blur.enable = false;
      blurplus = {
        enable = true;
        windowClasses = '''';
        blurStrength = 7;
      };
    };

    panels = [
      {
        location = "top";
        floating = true;
        hiding = "dodgewindows";
        height = 40;
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
                elements = [ "windowTitle" ];
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
                position = "besideTime";
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
          "org.kde.plasma.pager"
          "org.kde.plasma.notes"
          "org.kde.plasma.calculator"
          {
            iconTasks = {
              launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:org.kde.konsole.desktop"
                "applications:code.desktop"
                "applications:firefox.desktop"
              ];
              appearance.iconSpacing = "small";
            };
          }
          "org.kde.plasma.colorpicker"
        ];
      }
    ];

  };
}
