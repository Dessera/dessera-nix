{ config, lib, ... }:

let
  inherit (lib) mkIf;

  cfg = config.dnix.desktops.plasma6;
in
{
  config = mkIf cfg.enable {
    programs.plasma.configFile.kdeglobals.General = {
      TerminalApplication = "wezterm";
      TerminalService = "org.wezfurlong.wezterm.desktop";
    };

    programs = {
      fuzzel.enable = true;
      wezterm.enable = true;
    };
  };
}
