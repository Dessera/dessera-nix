_: _:
{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.desktop.plasma;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.desktop.plasma = {
    enable = mkEnableOption "Enable plasma package";
  };

  config = mkIf cfg.enable {
    services = {
      desktopManager.plasma6 = {
        enable = true;
      };
    };

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      elisa
      kate
      xwaylandvideobridge
    ];
  };
}
