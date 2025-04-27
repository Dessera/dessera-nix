_:
{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.desktop.sddm;

  inherit (lib)
    mkEnableOption
    mkOption
    mkIf
    types
    ;
in
{
  options.modules.desktop.sddm = {
    enable = mkEnableOption "Enable sddm package";
    useWayland = mkOption {
      type = types.bool;
      default = true;
      description = "Enable wayland support";
    };
  };

  config = mkIf cfg.enable {
    services = {
      displayManager.sddm = {
        enable = true;
        autoNumlock = true;
        wayland.enable = cfg.useWayland;

        package = lib.mkDefault pkgs.kdePackages.sddm;

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
