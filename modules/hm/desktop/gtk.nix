_:
{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.desktop.gtk;
  cfgGtk2 = config.gtk.gtk2;
  inherit (lib) mkEnableOption mkIf mkForce;
in
{

  options.modules.desktop.gtk = {
    enable = mkEnableOption "Enable gtk configuration";
  };

  config = mkIf cfg.enable {
    gtk = {
      enable = true;
      catppuccin-extra.enable = true;

      gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

      gtk3.extraConfig = {
        gtk-im-module = "fcitx";
      };
    };

    # force unset the gtk2 configuration
    # for unknown reason, the gtk2 configuration will cause the home-manager to fail
    home.file.${cfgGtk2.configLocation}.enable = mkForce false;
  };
}
