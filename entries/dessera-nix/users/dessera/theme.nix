{ pkgs, ... }:

let
  cursorTheme = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 24;
  };
  backgroundUrl = ../assets/background.jpg;
in
{
  home.pointerCursor = cursorTheme // {
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    inherit cursorTheme;
    theme = {
      name = "Fluent-orange-Dark";
      package = pkgs.fluent-gtk-theme.override {
        themeVariants = [ "orange" ];
        tweaks = [ ];
      };
    };
    iconTheme = {
      name = "Fluent-orange";
      package = pkgs.fluent-icon-theme.override {
        colorVariants = [ "orange" ];
      };
    };
  };

  programs.gnome-shell = {
    enable = true;
    theme = {
      name = "Orchis-Orange-Dark";
      package = pkgs.orchis-theme.override {
        border-radius = 5;
        tweaks = [ "macos" "black" "submenu" "primary" ];
      };
    };
    extensions = with pkgs.gnomeExtensions; [
      {
        package = window-title-is-back;
      }
      {
        package = dash-to-dock;
      }
      {
        package = appindicator;
      }
    ];
  };

  dconf.settings = {
    "org/gnome/desktop/background" = {
      picture-uri = "file://${backgroundUrl}";
      picture-uri-dark = "file://${backgroundUrl}";
    };
  };
}
