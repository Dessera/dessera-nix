{ pkgs, lib, ... }:

lib.dnix.mkUser {
  username = "dessera";
  name = "Dessera";
  email = "dessera@qq.com";
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
