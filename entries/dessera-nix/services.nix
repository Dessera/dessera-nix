{ lib, pkgs, ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    desktopManager.gnome = {
      enable = true;
    };
    displayManager.gdm = {
      enable = true;
    };
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

  virtualisation = {
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;

      defaultNetwork = {
        settings = {
          dns_enabled = true;
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    podman-compose
    dive
    shadow
  ];

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
    (pkgs.callPackage
      ../../packages/xilinx/xilinx-dilligent-usb-udev.nix
      { })
    (pkgs.callPackage
      ../../packages/xilinx/xilinx-pcusb-udev.nix
      { })
    (pkgs.callPackage
      ../../packages/xilinx/xilinx-ftdi-usb-udev.nix
      { })
  ];
}
