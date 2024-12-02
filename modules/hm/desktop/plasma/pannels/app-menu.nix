{
  location = "top";
  floating = true;
  height = 38;
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
