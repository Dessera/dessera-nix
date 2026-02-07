{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.system.optimize;
in
{
  options.dnix.system.optimize = {
    enable = mkEnableOption "optimize";
  };

  config = mkIf cfg.enable {
    nix = {
      settings.auto-optimise-store = true;
      optimise.automatic = true;
    };
  };
}
