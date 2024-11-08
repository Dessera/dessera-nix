{ lib, ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
  };

  networking = {
    hostName = "dessera-nix";
    useDHCP = lib.mkDefault true;
    networkmanager.enable = true;
    hosts = {
      "199.232.96.133" = [ "raw.githubusercontent.com" ];
    };
  };

  security = {
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
    };
    sudo.enable = false;
  };

  services.openssh = {
    enable = true;
    ports = [ 39901 ];
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      KbdInteractiveAuthentication = false;
      X11Forwarding = true;
    };
  };

  modules.services = {
    cygnus-rs = {
      enable = true;
      userFile = "/etc/cygnus.usr";
    };
    v2ray.enable = true;
  };
}
