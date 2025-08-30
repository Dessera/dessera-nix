{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;
  inherit (config.catppuccin) flavor;

  cfg = config.programs.konsole.catppuccin;

  defaultProfile = config.programs.konsole.defaultProfile or "default";
in
{
  options.programs.konsole.catppuccin = {
    enable = mkEnableOption "Enable catppuccin konsole configuration";
  };

  config = mkIf cfg.enable {
    programs.konsole.profiles.${defaultProfile} = {
      colorScheme = "catppuccin-${flavor}";
    };

    home.packages = with pkgs; [
      (externPkgs.catppuccin-konsole.override { inherit flavor; })
    ];
  };
}
