_:
{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.services.clash;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.services.clash = {
    enable = mkEnableOption "Enable clash service";
  };

  config = mkIf cfg.enable {
    programs.clash-verge = {
      enable = true;
      package = pkgs.clash-verge-rev;
      autoStart = true;
    };
  };
}
