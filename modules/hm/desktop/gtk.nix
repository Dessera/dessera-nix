_:
{ meta, ... }:
{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.desktop.gtk;
  cfgGtk2 = config.gtk.gtk2;
  inherit (lib) mkEnableOption mkIf mkForce;

  inherit (meta.appearance) flavor accent;
in
{

  options.modules.desktop.gtk = {
    enable = mkEnableOption "Enable gtk configuration";
  };

  config = mkIf cfg.enable {
    gtk = {
      enable = true;
      theme = {
        name = "catppuccin-${flavor}-${accent}-standard";
        package = pkgs.catppuccin-gtk.override {
          variant = flavor;
          accents = [ accent ];
        };
      };

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
