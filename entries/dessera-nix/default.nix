{ modulesPath, ... }:

{
  imports = [

    # Nix settings
    ../../common/nixos/settings.nix

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
    ../../common/nixos/fonts.nix

    # Other
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  system.stateVersion = "24.05";
}
