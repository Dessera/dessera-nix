_: _:
{ config, lib, ... }:

let
  cfg = config.modules.desktop.gtk;
  inherit (lib) mkEnableOption mkIf;
in
{

  options.modules.desktop.gtk = {
    enable = mkEnableOption "Enable gtk configuration";
  };

  config = mkIf cfg.enable {
    gtk = {
      enable = true;
      # ! catppuccin no longer supports the gtk
      # ! but it is still possible to use the theme
      catppuccin = {
        enable = true;
      };
    };
  };
}
