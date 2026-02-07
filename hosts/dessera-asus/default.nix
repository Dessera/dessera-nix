{ modulesPath, ... }:

{
  imports = [
    ./boot.nix
    ./desktops.nix
    ./fstab.nix
    ./hardware.nix
    ./programs.nix
    ./services.nix
    ./settings.nix

    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  dnix.system = {
    fonts.enable = true;
    network.enable = true;
    optimize.enable = true;
    style.enable = true;
  };

  time.timeZone = "Asia/Shanghai";
  i18n.defaultLocale = "zh_CN.UTF-8";

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  system.stateVersion = "23.11";
}
