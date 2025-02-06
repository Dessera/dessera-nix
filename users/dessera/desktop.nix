{ pkgs, ... }:
let
  fontOpt = import ../../common/font.nix pkgs;
in
{
  modules.desktop = {
    gtk.enable = true;
    plasma = {
      enable = true;
      defaultApplications = {
        terminal = {
          application = "yakuake";
          service = "org.kde.yakuake.desktop";
        };
      };
      dockApplications = [
        "applications:org.kde.dolphin.desktop"
        "applications:org.kde.yakuake.desktop"
        "applications:code.desktop"
        "applications:firefox.desktop"
        "applications:org.kde.spectacle.desktop"
        "applications:systemsettings.desktop"
      ];
      fonts = {
        general = {
          family = fontOpt.defaultFonts.sansSerif;
          pointSize = 12;
        };
        fixedWidth = {
          family = fontOpt.defaultFonts.monospace;
          pointSize = 10;
        };
        small = {
          family = fontOpt.defaultFonts.sansSerif;
          pointSize = 8;
        };
        toolbar = {
          family = fontOpt.defaultFonts.sansSerif;
          pointSize = 10;
        };
        menu = {
          family = fontOpt.defaultFonts.sansSerif;
          pointSize = 10;
        };
        windowTitle = {
          family = fontOpt.defaultFonts.sansSerif;
          pointSize = 10;
        };
      };
    };
    qt.enable = true;
  };
}
