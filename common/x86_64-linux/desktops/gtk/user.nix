{ pkgs, ... }:

{
  gtk = {
    enable = true;
    theme = {
      name = "Fluent-orange-Dark";
      package = pkgs.fluent-gtk-theme.override {
        themeVariants = [ "orange" ];
        tweaks = [ ];
      };
    };
  };
}
