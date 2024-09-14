{ config, lib, ... }:

let
  cfg = config.modules.packages.fish;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.packages.fish = {
    enable = mkEnableOption "Enable fish";
  };

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
    };
  };
}
