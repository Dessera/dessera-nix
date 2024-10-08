{ config, lib, pkgs-master, ... }:

let
  cfg = config.modules.packages.clash;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.packages.clash = {
    enable = mkEnableOption "Enable clash";
  };

  config = mkIf cfg.enable {
    programs.clash-verge = {
      enable = true;
      tunMode = true;
      autoStart = true;
      package = pkgs-master.clash-verge-rev;
    };
  };
}
