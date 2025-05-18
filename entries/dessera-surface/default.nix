{ modulesPath, ... }:

{
  imports = [

    # Nix settings
    ../../common/nixos/settings.nix

    # Hardware
    ./hardware.nix

    # Fstab
    ./fstab.nix

    # All services
    ../../common/nixos/services.nix
    ./services.nix

    # All packages
    ../../common/shared/catppuccin.nix
    ../../common/nixos/packages.nix

    # Locale & Fonts
    ../../common/nixos/locale.nix
    ../../common/nixos/fonts.nix

    # Other
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  system.stateVersion = "24.05";
}
