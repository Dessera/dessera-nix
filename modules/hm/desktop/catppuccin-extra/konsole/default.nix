_:
{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (lib) mkIf mkEnableOption;
  inherit (config.catppuccin) flavor;

  cfg = config.programs.konsole.catppuccin-extra;

  defaultProfile = config.programs.konsole.defaultProfile or "default";
in
{
  options.programs.konsole.catppuccin-extra = {
    enable = mkEnableOption "Enable catppuccin-extra konsole configuration";
  };

  config = mkIf cfg.enable {
    programs.konsole.profiles.${defaultProfile} = {
      colorScheme = "catppuccin-${flavor}";
    };

    home.packages = [
      (pkgs.callPackage ./package.nix { inherit flavor; })
    ];
  };
}
