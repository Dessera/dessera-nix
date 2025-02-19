{ meta, ... }:
{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.packages.fish;
  inherit (lib) mkEnableOption mkIf;

  useFishPlugin = p: { inherit (p) name src; };
in
{
  options.modules.packages.fish = {
    enable = mkEnableOption "Enable fish";
  };

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      plugins = [
        (useFishPlugin pkgs.fishPlugins.pisces)

        (useFishPlugin pkgs.fishPlugins.plugin-git)
        (useFishPlugin pkgs.fishPlugins.z)
        (useFishPlugin pkgs.fishPlugins.fzf-fish)

        (useFishPlugin pkgs.fishPlugins.sponge)
        (useFishPlugin pkgs.fishPlugins.grc)
      ];

      functions = {
        gi = "curl -sL https://www.toptal.com/developers/gitignore/api/$argv";
      };

      shellInit = ''
        # disable fish_greeting
        set -x fish_greeting
        # LANG
        set -x LANG ${meta.locale.language}
      '';
    };

    home.packages = with pkgs; [
      grc
      fzf
      fd
      bat
    ];

    programs.starship = {
      enable = true;
      enableFishIntegration = true;
    };

    catppuccin.starship.enable = true;
  };
}
