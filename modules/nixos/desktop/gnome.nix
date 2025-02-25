_:
{ config, lib, ... }:

let
  cfg = config.modules.desktop.gnome;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.desktop.gnome = {
    enable = mkEnableOption "Enable gnome package";
  };

  config = mkIf cfg.enable {
    services.xserver.desktopManager.gnome.enable = true;
  };
}
