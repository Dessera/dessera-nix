_:
{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.packages.alacritty;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.packages.alacritty = {
    enable = mkEnableOption "Enable alacritty";
  };

  config = mkIf cfg.enable {
    programs.alacritty = {
      enable = true;

      settings = {
        window = {
          padding = {
            x = 5;
            y = 5;
          };
          dynamic_padding = true;
        };
        font = {
          size = 16;
        };
      };
    };

    catppuccin.alacritty.enable = true;
  };
}
