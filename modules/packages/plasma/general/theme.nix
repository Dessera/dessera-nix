pkgs: {
  gtk = {
    name = "catppuccin-mocha-flamingo-standard";
    package = pkgs.catppuccin-gtk.override {
      accents = [ "flamingo" ];
      variant = "mocha";
    };
  };
}
