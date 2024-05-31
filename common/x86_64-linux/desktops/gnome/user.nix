{ pkgs, ... }:

let
  backgroundUrl = ../assets/background.jpg;
in
{
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
      {
        package = hide-top-bar;
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
