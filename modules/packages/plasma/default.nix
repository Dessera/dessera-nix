{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.packages.plasma;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.packages.plasma = {
    enable = mkEnableOption "Enable plasma package";
  };

  config = mkIf cfg.enable {
    services = {
      displayManager.sddm = {
        enable = true;
      };

      desktopManager.plasma6 = {
        enable = true;
      };
    };
  };
}
