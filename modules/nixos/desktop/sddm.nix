_:
{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.desktop.sddm;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.desktop.sddm = {
    enable = mkEnableOption "Enable sddm package";
  };

  config = mkIf cfg.enable {
    services = {
      displayManager.sddm = {
        enable = true;
        autoNumlock = true;
        wayland.enable = true;

        settings = {
          General = {
            InputMethod = null;
          };
        };
      };
    };

    catppuccin.sddm.enable = true;
  };
}
