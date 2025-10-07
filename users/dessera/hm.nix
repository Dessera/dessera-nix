{
  imports = [
    ../../components/hm/stylix.nix
    ../../components/shared/catppuccin.nix

    ./packages.nix
  ];

  home = {
    username = "dessera";
    homeDirectory = "/home/dessera";
    stateVersion = "24.05";
  };
}
