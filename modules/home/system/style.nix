{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.system.style;
in
{
  options.dnix.system.style = {
    enable = mkEnableOption "style";
  };

  config = mkIf cfg.enable {
    stylix = {
      icons = {
        enable = true;
        package = pkgs.papirus-icon-theme;
        dark = "Papirus-Dark";
        light = "Papirus-Light";
      };
    };

    dnix.catppuccin.enable = true;
  };
}
