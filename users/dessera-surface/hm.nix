{ ... }:

{
  imports = [
    ../../common/hm/packages.nix
    ./desktop.nix
  ];

  home = {
    username = "dessera";
    homeDirectory = "/home/dessera";
    stateVersion = "24.05";
  };
}
