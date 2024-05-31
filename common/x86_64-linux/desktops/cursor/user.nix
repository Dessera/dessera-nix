{ pkgs, ... }:

let
  cursorTheme = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };
in
{
  home.pointerCursor = cursorTheme // {
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    inherit cursorTheme;
  };
}
