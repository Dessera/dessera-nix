_:
{ ... }:
{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.desktop.qt;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.desktop.qt = {
    enable = mkEnableOption "Enable qt configuration";
  };

  config = mkIf cfg.enable {
    home.sessionVariables = {
      QT_STYLE_OVERRIDE = "kvantum";
    };

    home.packages = with pkgs; [
      qt6Packages.qtstyleplugin-kvantum
    ];

    xdg.configFile = {
      "Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=catppuccin-mocha-lavender
      '';

      "Kvantum/catppuccin-mocha-lavender".source = "${
        pkgs.catppuccin-kvantum.override {
          accent = "lavender";
          variant = "mocha";
        }
      }/share/Kvantum/catppuccin-mocha-lavender";
    };
  };
}
