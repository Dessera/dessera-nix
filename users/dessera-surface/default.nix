{ pkgs, ... }:
{
  users.users.dessera = {
    name = "dessera";
    description = "Dessera";
    home = "/home/dessera";
    isNormalUser = true;

    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
    ];
  };

  home-manager.users.dessera = import ./hm.nix;
}
