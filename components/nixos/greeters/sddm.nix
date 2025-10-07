{ pkgs, lib, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    wayland.enable = true;

    package = lib.mkForce pkgs.kdePackages.sddm;

    settings = {
      General = {
        InputMethod = null;
      };
    };
  };

  catppuccin.sddm.enable = true;
}
