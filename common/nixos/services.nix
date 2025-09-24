{ lib, ... }:

{
  networking = {
    useDHCP = lib.mkDefault true;
    networkmanager.enable = true;
    hosts = {
      "199.232.96.133" = [ "raw.githubusercontent.com" ];
    };
  };

  programs.clash-verge = {
    enable = true;
    tunMode = true;
    serviceMode = true;
  };

  services.xserver.enable = true;
}
