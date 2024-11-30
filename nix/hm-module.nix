lib: {
  default = lib.default.importModule ../modules/home-manager.nix;
  generator = customModuleUtils: customModuleUtils.importModule ../modules/home-manager.nix;
}
