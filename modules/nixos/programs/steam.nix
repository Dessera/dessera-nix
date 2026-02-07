{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.programs.steam;
in
{
  options.dnix.programs.steam = {
    enable = mkEnableOption "steam";
  };

  config = mkIf cfg.enable {
    programs.steam = {
      enable = true;
      protontricks.enable = true;
      extest.enable = true;
    };
  };
}
