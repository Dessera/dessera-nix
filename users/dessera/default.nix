{ pkgs, lib, ... }:

lib.dnix.mkUser {
  username = "dessera";
  name = "Dessera";
  shell = pkgs.fish;
  groups = [
    "wheel"
    "networkmanager"
    "video"
    "audio"
    "dialout"
    "uucp"
  ];
  modules = [ ./hm-default.nix ];
}
