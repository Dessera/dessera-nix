{ config, lib, ... }:

let
  inherit (lib) mkIf;

  cfg = config.dnix.desktops.plasma6;
in
{
  config = mkIf cfg.enable {
    programs.plasma = {
      input.keyboard.numlockOnStartup = "on";

      hotkeys = {
        commands = {
          terminal = {
            command = "wezterm";
            comment = "Run terminal";
            key = "Ctrl+Alt+T";
          };
          launcher = {
            command = "fuzzel";
            comment = "Run fuzzel app launcher";
            key = "Alt+Space";
          };
        };
      };
    };
  };
}
