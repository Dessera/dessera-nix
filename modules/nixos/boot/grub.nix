{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.boot.grub;
in
{
  options.dnix.boot.grub = {
    enable = mkEnableOption "grub";
  };

  config = mkIf cfg.enable {
    boot.loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
    };

    catppuccin.grub.enable = true;
  };
}
