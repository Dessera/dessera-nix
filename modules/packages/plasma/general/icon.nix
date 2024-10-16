pkgs: {
  name = "Fluent-orange";
  package = pkgs.fluent-icon-theme.override {
    colorVariants = [ "orange" ];
  };
}
