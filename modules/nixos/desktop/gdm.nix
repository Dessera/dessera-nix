_:
{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.desktop.gdm;
  inherit (lib)
    mkEnableOption
    mkOption
    mkIf
    types
    ;
in
{
  options.modules.desktop.gdm = {
    enable = mkEnableOption "Enable gdm package";
    useWayland = mkOption {
      type = types.bool;
      default = true;
      description = "Enable wayland support";
    };
  };

  config = mkIf cfg.enable {
    services.xserver.displayManager.gdm = {
      enable = true;
      wayland = cfg.useWayland;
    };
  };
}
