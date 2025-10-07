{ pkgs, ... }:

let
  mkPreset =
    src:
    pkgs.callPackage (
      { stdenv }:
      let
        name = builtins.baseNameOf src;
      in
      stdenv.mkDerivation {
        inherit name src;

        installPhase = ''
          mkdir -p $out
          cp -r $src/* $out
        '';
      }
    ) { };
in
{
  programs.plasma.panels = [
    {
      location = "top";
      floating = true;
      hiding = "dodgewindows";
      lengthMode = "fit";
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
          plasmaPanelColorizer = {
            settings = {
              General = {
                presetAutoloading = "{\\\"enabled\\\":true,\\\"normal\\\":\\\"${mkPreset ./panel-presets/dessera-top-tray}\\\"}";
              };
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
        {
          plasmaPanelColorizer = {
            settings = {
              General = {
                presetAutoloading = "{\\\"enabled\\\":true,\\\"normal\\\":\\\"${mkPreset ./panel-presets/dessera-bottom-tasks}\\\"}";
              };
            };
          };
        }
      ];
    }
  ];
}
