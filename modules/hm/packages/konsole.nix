_:
{
  config,
  lib,
  ...
}:
let
  inherit (lib)
    mkIf
    types
    mkOption
    mkEnableOption
    ;

  cfg = config.modules.packages.konsole;

in
{
  options.modules.packages.konsole = {
    enable = mkEnableOption "Enable konsole configuration";
    font = {
      family = mkOption {
        type = types.str;
        default = "Hack";
        description = "The font to use for konsole";
      };
      size = mkOption {
        type = types.int;
        default = 16;
        description = "The font size to use for konsole";
      };
    };
  };

  config = mkIf cfg.enable {
    programs.konsole = {
      enable = true;
      catppuccin-extra.enable = true;

      defaultProfile = "default";

      profiles.default = {
        font = {
          name = cfg.font.family;
          size = cfg.font.size;
        };
      };
    };
  };
}
