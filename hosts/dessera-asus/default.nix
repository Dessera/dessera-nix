{ modulesPath, ... }:

{
  imports = [
    ./boot.nix
    ./desktops.nix
    ./fstab.nix
    ./hardware.nix
    ./network.nix
    ./programs.nix
    ./services.nix
    ./settings.nix

    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  dnix = {
    style.enable = true;
    fonts.enable = true;
    locale.enable = true;
    network.enable = true;

    system.optimize.enable = true;
  };

  system.stateVersion = "23.11";
}
