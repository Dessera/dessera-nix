pkgs: {
  gtk = {
    name = "catppuccin-mocha-flamingo-standard";
    package = pkgs.catppuccin-gtk.override {
      accents = [ "flamingo" ];
      variant = "mocha";
    };
  };
  plasma = {
    lookAndFeel = "Catppuccin-Mocha-Flamingo";
    colorScheme = "CatppuccinMochaFlamingo";
    package = pkgs.catppuccin-kde.override {
      flavour = [ "mocha" ];
      accents = [ "flamingo" ];
    };
  };
}
