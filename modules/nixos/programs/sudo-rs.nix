{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.programs.sudo-rs;
in
{
  options.dnix.programs.sudo-rs = {
    enable = mkEnableOption "sudo-rs";
  };

  config = mkIf cfg.enable {
    security.sudo-rs = {
      enable = true;
      execWheelOnly = true;
    };
  };
}
