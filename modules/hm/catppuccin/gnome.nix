{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.programs.gnome.catppuccin;
  gtkCfg = config.gtk;
  catppuccinCfg = config.catppuccin;
in
{
  options.programs.gnome.catppuccin = {
    enable = mkEnableOption "Enable Catppuccin extra configuration for GNOME";
  };

  config = mkIf cfg.enable {
    assertions = [
      {
        assertion = gtkCfg.enable && gtkCfg.catppuccin.enable;
        message = "`gtk.enable` and `gtk.catppuccin.enable` must be `true` to use the GNOME shell theme";
      }
    ];

    home.packages = [ pkgs.gnomeExtensions.user-themes ];

    dconf.settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          "user-theme@gnome-shell-extensions.gcampax.github.com"
        ];
      };
      "org/gnome/shell/extensions/user-theme" = {
        inherit (gtkCfg.theme) name;
      };
      "org/gnome/desktop/interface" = {
        color-scheme = if catppuccinCfg.flavor == "latte" then "default" else "prefer-dark";
      };
    };
  };
}
