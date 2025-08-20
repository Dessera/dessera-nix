{
  config,
  pkgs,
  lib,
  ...
}:

let
  conf = import ../config.nix;
  fontOpt = import ../font.nix pkgs;

  wpImage = pkgs.externLibs.mkImage conf.wallpaper;
in
{
  gtk = {
    enable = true;
    catppuccin-ext.enable = true;

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    gtk3.extraConfig.gtk-im-module = "fcitx";
  };

  # force unset the gtk2 configuration
  # for unknown reason, the gtk2 configuration will cause the home-manager to fail
  home.file.${config.gtk.gtk2.configLocation}.enable = lib.mkForce false;

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  catppuccin.kvantum = {
    enable = true;
    apply = true;
  };

  programs.plasma = {
    enable = true;
    catppuccin.enable = true;

    input.keyboard.numlockOnStartup = "on";

    workspace.wallpaper = wpImage;
    kscreenlocker.appearance.wallpaper = wpImage;

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

    fonts =
      let
        mkPlasmaFont = family: pointSize: { inherit family pointSize; };
      in
      {
        general = mkPlasmaFont fontOpt.defaultFonts.sansSerif 12;
        fixedWidth = mkPlasmaFont fontOpt.defaultFonts.monospace 10;
        small = mkPlasmaFont fontOpt.defaultFonts.sansSerif 8;
        toolbar = mkPlasmaFont fontOpt.defaultFonts.sansSerif 10;
        menu = mkPlasmaFont fontOpt.defaultFonts.sansSerif 10;
        windowTitle = mkPlasmaFont fontOpt.defaultFonts.sansSerif 10;
      };

    session = {
      sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
    };

    panels = [
      {
        location = "bottom";
        floating = true;
        hiding = "dodgewindows";
        height = 42;
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
          {
            iconTasks = {
              launchers = [
                "applications:org.kde.dolphin.desktop"
                "applications:org.kde.konsole.desktop"
                "applications:code.desktop"
                "applications:firefox.desktop"
                "applications:qq.desktop"
              ];
              appearance.iconSpacing = "small";
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
                enable = false;
              };
            };
          }
          {
            plasmaPanelColorizer = {
              settings = {
                General = {
                  presetAutoloading = "{\\\"enabled\\\":true,\\\"normal\\\":\\\"${pkgs.dessera-dock-preset}\\\"}";
                };
              };
            };
          }
        ];
      }
    ];

    configFile = {
      kdeglobals.KDE.widgetStyle.value = "kvantum-dark";
      kwinrc.Wayland.InputMethod = "/run/current-system/sw/share/applications/fcitx5-wayland-launcher.desktop";
      kwinrc."org.kde.kdecoration2" = {
        BorderSize = "None";
        BorderSizeAuto = false;
        ButtonsOnLeft = "";
        ButtonsOnRight = "IAX";
      };
      kwinrc."Round-Corners" = {
        ActiveOutlineUseCustom = false;
        ActiveOutlineUsePalette = true;
        ActiveSecondOutlineUseCustom = false;
        ActiveSecondOutlineUsePalette = true;
        InactiveCornerRadius = 15;
        InactiveOutlineThickness = 0;
        InactiveOutlineUseCustom = false;
        InactiveOutlineUsePalette = true;
        InactiveSecondOutlineThickness = 0;
        InactiveSecondOutlineUseCustom = false;
        InactiveSecondOutlineUsePalette = true;
        Inclusions = "org.kde.plasmashell";
        OutlineThickness = 0;
        SecondOutlineThickness = 0;
        Size = 15;
      };
    };
  };

  home.packages = with pkgs; [
    kde-rounded-corners
  ];

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };
}
