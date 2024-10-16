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

  services.vscode-server.enable = true;
}
