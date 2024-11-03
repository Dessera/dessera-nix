{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.desktop.plasma;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.desktop.plasma = {
    enable = mkEnableOption "Enable plasma package";
  };

  config = mkIf cfg.enable {
    services = {
      desktopManager.plasma6 = {
        enable = true;
        enableQt5Integration = true;
      };
    };
  };
}
