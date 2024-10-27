{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.services.v2ray;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.services.v2ray = {
    enable = mkEnableOption "Enable v2ray";
  };

  config = mkIf cfg.enable {
    services.v2raya = {
      enable = true;
    };
  };
}
