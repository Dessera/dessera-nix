{ ... }:

{
  imports = [
    ./packages.nix
  ];

  home = {
    username = "dessera";
    homeDirectory = "/home/dessera";
    stateVersion = "24.05";
  };

  modules.desktop = {
    gtk.enable = true;
    plasma.enable = true;
    # qt.enable = true;
  };
}
