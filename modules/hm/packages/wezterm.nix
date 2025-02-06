{ mlib, ... }:
{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.packages.wezterm;

  inherit (config.catppuccin) flavor;
  flavorUpper = mlib.toUpperInitial flavor;

  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.packages.wezterm = {
    enable = mkEnableOption "Enable wezterm";
  };

  config = mkIf cfg.enable {
    programs.wezterm = {
      enable = true;
      extraConfig = ''
        return {
          color_scheme = "Catppuccin ${flavorUpper}",

          font_size = 16.0,
          window_decorations = "TITLE | RESIZE",
        }
      '';
    };
  };
}
