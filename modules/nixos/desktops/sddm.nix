{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.desktops.sddm;
in
{
  options.dnix.desktops.sddm = {
    enable = mkEnableOption "sddm";
  };

  config = mkIf cfg.enable {
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
  };
}
