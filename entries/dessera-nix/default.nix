{ modulesPath, ... }:

{
  imports = [

    # Nix settings
    ./settings.nix

    # Bootloader
    ./bootloader.nix

    # Fstab
    ./fstab.nix

    # All services
    ./services.nix

    # All packages
    ./packages.nix

    # Locale & Fonts
    ./locale.nix
    ./fonts.nix

    # All users
    # ./users

    # Other
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
}
