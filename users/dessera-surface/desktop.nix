{ pkgs, ... }:
let
  fontOpt = import ../../common/font.nix pkgs;
in
{
  modules.desktop = {
    gtk.enable = true;
    gnome = {
      enable = true;
      fonts =
        let
          mkGnomeFont = name: size: { inherit name size; };
        in
        {
          interface = mkGnomeFont fontOpt.defaultFonts.sansSerif 12;
          document = mkGnomeFont fontOpt.defaultFonts.sansSerif 11;
          monospace = mkGnomeFont fontOpt.defaultFonts.monospace 10;
        };

      dockApplications = [
        "org.gnome.Nautilus.desktop"
        "com.mitchellh.ghostty.desktop"
        "code.desktop"
        "firefox.desktop"
      ];
    };
    qt.enable = true;
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };
}
