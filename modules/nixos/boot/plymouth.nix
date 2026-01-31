{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.boot.plymouth;
in
{
  options.dnix.boot.plymouth = {
    enable = mkEnableOption "plymouth";
  };

  config = mkIf cfg.enable {
    boot.plymouth.enable = true;
  };
}
