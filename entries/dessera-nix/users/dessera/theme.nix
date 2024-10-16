{ pkgs, ... }:

{
  gtk = {
    enable = true;
    # inherit cursorTheme;
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
}
