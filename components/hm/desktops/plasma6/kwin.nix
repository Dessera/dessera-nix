{ pkgs, ... }:

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
        Exclusions = "fuzzel,plasmashell";
        OutlineThickness = 0;
        SecondOutlineThickness = 0;
        Size = 15;
      };
    };
  };

  home.packages = with pkgs; [
    kde-rounded-corners
  ];
}
