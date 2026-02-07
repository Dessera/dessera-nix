{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.network;
in
{
  options.dnix.network = {
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
