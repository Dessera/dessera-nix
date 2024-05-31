{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      package = pkgs.numix-gtk-theme;
    };
  };
}
