_:
{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.desktop.gnome;
  inherit (lib) mkEnableOption mkIf;
in
{

  options.modules.desktop.gnome = {
    enable = mkEnableOption "Enable gnome configuration";
  };

  config = mkIf cfg.enable {
    programs.gnome.catppuccin-extra.enable = true;

    home.packages = with pkgs.gnomeExtensions; [
      app-menu-is-back
      appindicator
      dash-to-dock
    ];

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "appmenu-is-back@fthx"
          "dash-to-dock@micxgx.gmail.com"
        ];
      };
    };
  };
}
