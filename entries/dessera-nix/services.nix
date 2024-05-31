{ lib, ... }:

{
  imports = [
    # Bluetooth services
    ../../common/x86_64-linux/services/bluetooth.nix

    # Pipewire services
    ../../common/x86_64-linux/services/pipewire.nix

    # Desktop & Greeter services
    ../../common/x86_64-linux/desktops/gnome/system.nix
    ../../common/x86_64-linux/greeters/gdm.nix

    # Virtualization services
    ../../common/x86_64-linux/services/podman.nix

    # Security services
    ../../common/x86_64-linux/services/doas.nix


    ../../common/x86_64-linux/services/xserver.nix
  ];

  networking = {
    hostName = "dessera-nix";
    useDHCP = lib.mkDefault true;
    networkmanager.enable = true;
    hosts = {
      "199.232.96.133" = [ "raw.githubusercontent.com" ];
    };
  };

  services.openssh = {
    enable = true;
    ports = [ 39901 ];
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      KbdInteractiveAuthentication = false;
    };
  };
}
