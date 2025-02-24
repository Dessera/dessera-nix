{ lib, ... }:

{

  networking = {
    hostName = "dessera-nix";
    useDHCP = lib.mkDefault true;
    networkmanager.enable = true;
    hosts = {
      "199.232.96.133" = [ "raw.githubusercontent.com" ];
    };
  };

  modules.services = {
    cygnus-rs = {
      enable = true;
      userFile = "/etc/cygnus.usr";
    };
    v2ray.enable = true;
  };

  services = {
    xserver = {
      enable = true;
    };
    # openssh = {
    #   enable = true;
    #   ports = [ 39901 ];
    #   settings = {
    #     PasswordAuthentication = false;
    #     PermitRootLogin = "no";
    #     KbdInteractiveAuthentication = false;
    #     X11Forwarding = true;
    #   };
    # };
  };
}
