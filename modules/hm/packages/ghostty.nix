_:
{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.packages.ghostty;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.packages.ghostty = {
    enable = mkEnableOption "Enable ghostty";
  };

  config = mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
      settings = {
        font-size = 16;
        window-padding-x = 5;
        window-padding-y = 5;
        window-decoration = "client";
      };
    };

    catppuccin.ghostty.enable = true;
  };
}
