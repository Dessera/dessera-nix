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
          application = "konsole";
          service = "org.kde.konsole.desktop";
        };
      };
      dockApplications = [
        "applications:org.kde.dolphin.desktop"
        "applications:org.kde.konsole.desktop"
        "applications:code.desktop"
        "applications:firefox.desktop"
        "applications:org.kde.spectacle.desktop"
        "applications:systemsettings.desktop"
      ];
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
      effects = {
        transparent.enable = true;
      };
    };
    qt.enable = true;
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };
}
