{ lib, ... }:

{
  networking = {
    useDHCP = lib.mkDefault true;
    networkmanager.enable = true;
    hosts = {
      "199.232.96.133" = [ "raw.githubusercontent.com" ];
    };
  };

  modules.services = {
    clash.enable = true;
  };

  services.xserver.enable = true;
}
