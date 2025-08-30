inputs: self: {
  externPkgs = import ./extern-pkgs.nix inputs self;
  externLibs = import ./extern-libs.nix inputs self;
}
