{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.services.xserver;
in
{
  options.dnix.services.xserver = {
    enable = mkEnableOption "xserver";
  };

  config = mkIf cfg.enable {
    services.xserver = {
      enable = true;
      excludePackages = with pkgs; [ xterm ];
    };
  };
}
