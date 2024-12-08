{ modulesPath, ... }:

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
}
