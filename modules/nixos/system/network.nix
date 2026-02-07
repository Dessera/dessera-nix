{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.system.network;
in
{
  options.dnix.system.network = {
    enable = mkEnableOption "network";
  };

  config = mkIf cfg.enable {
    networking = {
      useDHCP = lib.mkDefault true;
      networkmanager.enable = true;
      hosts = {
        "199.232.96.133" = [ "raw.githubusercontent.com" ];
      };
    };
  };
}
