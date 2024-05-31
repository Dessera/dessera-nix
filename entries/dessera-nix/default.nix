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

    # All users
    # ./private/users.nix
    ./users

    # Private
    ./private

    # Locale & Fonts
    ../../common/x86_64-linux/localization/zh_CN.nix
    ../../common/x86_64-linux/desktops/fonts/system.nix

    # Other
    (modulesPath + "/installer/scan/not-detected.nix")
  ];
}
