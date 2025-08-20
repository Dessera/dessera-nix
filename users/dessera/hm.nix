{ ... }:

{
  imports = [
    ../../common/shared/catppuccin.nix
    ../../common/hm/desktop.nix
    ../../common/hm/packages.nix
  ];

  home = {
    username = "dessera";
    homeDirectory = "/home/dessera";
    stateVersion = "24.05";
  };
}
