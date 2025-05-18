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

    kwin.virtualDesktops = {
      names = [
        "VD1"
        "VD2"
        "VD3"
        "VD4"
      ];
      number = 4;
      rows = 2;
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
        InactiveOutlineThickness = 3;
        InactiveOutlineUseCustom = false;
        InactiveOutlineUsePalette = true;
        OutlineThickness = 3;
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
