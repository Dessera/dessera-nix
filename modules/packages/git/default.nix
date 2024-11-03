{ config, lib, ... }:

let
  cfg = config.modules.packages.git;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.packages.git = {
    enable = mkEnableOption "Enable git";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      lfs.enable = true;
    };
  };
}
