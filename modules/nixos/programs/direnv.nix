{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.programs.direnv;
in
{
  options.dnix.programs.direnv = {
    enable = mkEnableOption "direnv";
  };

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;

      enableBashIntegration = true;
      enableFishIntegration = true;
      enableXonshIntegration = true;
      enableZshIntegration = true;
    };
  };
}
