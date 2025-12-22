{
  programs.plasma = {
    kwin = {
      virtualDesktops = {
        names = [
          "VD1"
          "VD2"
          "VD3"
          "VD4"
        ];
        number = 4;
        rows = 2;
      };
      nightLight = {
        enable = true;
        mode = "times";
        temperature = {
          day = 6500;
          night = 4500;
        };
        time = {
          morning = "06:30";
          evening = "19:30";
        };
        transitionTime = 30;
      };
      effects = {
        shakeCursor.enable = true;
        dimAdminMode.enable = true;

        windowOpenClose.animation = "fade";
        minimization.animation = "squash";
      };
    };

    configFile = {
      kwinrc.Wayland.InputMethod = "/run/current-system/sw/share/applications/fcitx5-wayland-launcher.desktop";
      kwinrc.Plugins = {
        kzonesEnabled = true;
      };
      kwinrc."org.kde.kdecoration2" = {
        BorderSize = "None";
        BorderSizeAuto = false;
        ButtonsOnLeft = "";
        ButtonsOnRight = "IAX";
      };
      kwinrc."Script-kzones" = {
        layoutJson = ''
          [{"name":"PriorityGrid","padding":0,"zones":[{"x":0,"y":0,"height":100,"width":25},{"x":25,"y":0,"height":100,"width":50,"applications":["firefox"]},{"x":75,"y":0,"height":100,"width":25}]},{"name":"QuadrantGrid","padding":0,"zones":[{"x":0,"y":0,"height":50,"width":50},{"x":0,"y":50,"height":50,"width":50},{"x":50,"y":50,"height":50,"width":50},{"x":50,"y":0,"height":50,"width":50}]},{"name":"Columns","padding":0,"zones":[{"x":0,"y":0,"height":100,"width":50},{"x":50,"y":0,"height":100,"width":50}]},{"name":"Rows","padding":0,"zones":[{"x":0,"y":0,"height":50,"width":100},{"x":0,"y":50,"height":50,"width":100}]}]
        '';
        trackLayoutPerScreen = true;
        zoneOverlayIndicatorDisplay = 1;
      };
    };
  };
}
