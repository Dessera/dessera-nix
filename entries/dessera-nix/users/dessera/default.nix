{ ... }:

{
  imports = [

    ./packages.nix

    ./theme.nix

    ./i18n.nix
  ];

  home = {
    username = "dessera";
    homeDirectory = "/home/dessera";
    stateVersion = "24.05";
  };
}
