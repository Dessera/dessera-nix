inputs: self: final: prev: {
  externPkgs = {
    catppuccin-konsole = prev.callPackage ./packages/catppuccin-konsole.nix { };
  };
}
