{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.desktops.plasma6;
in
{
  options.dnix.desktops.plasma6 = {
    enable = mkEnableOption "plasma6";
  };

  config = mkIf cfg.enable {
    services.desktopManager.plasma6.enable = true;
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      konsole
      elisa
      kate
    ];
  };
}
