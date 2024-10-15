{ lib, pkgs, ... }:

{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    # desktopManager.gnome = {
    #   enable = true;
    # };
    # displayManager.gdm = {
    #   enable = true;
    # };
  };

  services.displayManager.sddm = {
    enable = true;
  };

  services.desktopManager.plasma6 = {
    enable = true;
  };

  # hardware.pulseaudio.enable = true;

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

  services.vscode-server.enable = true;
}
