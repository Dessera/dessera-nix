{ modulesPath, ... }:

{
  imports = [
    ../../components/nixos/settings.nix
    ../../components/nixos/stylix.nix
    ../../components/shared/catppuccin.nix
    ../../components/nixos/locale.nix
    ../../components/nixos/fonts.nix

    ./hardware.nix
    ./boot.nix
    ./fstab.nix
    ./network.nix
    ./services.nix
    ./packages.nix

    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  system.stateVersion = "23.11";
}
