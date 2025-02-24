{ modulesPath, pkgs, ... }:

{
  imports = [

    # Nix settings
    ./settings.nix

    # Hardware
    ./hardware.nix

    # Bootloader
    ./boot.nix

    # Fstab
    ./fstab.nix

    # All services
    ./services.nix

    # All packages
    ./packages.nix

    # Locale & Fonts
    ./locale.nix
    ./fonts.nix

    # Other
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  users.users.dessera = {
    name = "dessera";
    description = "Dessera";
    home = "/home/dessera";
    isNormalUser = true;

    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
    ];
  };
}
