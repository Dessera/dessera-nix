{ lib, pkgs, ... }:

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
    doas = {
      enable = true;
      extraRules = [
        {
          users = [ "dessera" ];
          keepEnv = true;
          persist = true;
        }
      ];
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

  services.udev.packages = [
    (pkgs.callPackage ../../packages/xilinx/xilinx-dilligent-usb-udev.nix { })
    (pkgs.callPackage ../../packages/xilinx/xilinx-pcusb-udev.nix { })
    (pkgs.callPackage ../../packages/xilinx/xilinx-ftdi-usb-udev.nix { })
  ];

  modules.services = {
    cygnus-rs = {
      enable = true;
      userFile = "/etc/cygnus.usr";
    };
  };
}
