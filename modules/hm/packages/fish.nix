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
in
{
  options.modules.packages.fish = {
    enable = mkEnableOption "Enable fish";
  };

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      plugins = [
        { inherit (pkgs.fishPlugins.grc) name src; }
        { inherit (pkgs.fishPlugins.pisces) name src; }
        { inherit (pkgs.fishPlugins.plugin-git) name src; }
        { inherit (pkgs.fishPlugins.sponge) name src; }
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

      # interactiveShellInit = ''
      #   # tmux.fish
      #   set fish_tmux_autostart true
      # '';
    };

    home.packages = with pkgs; [
      grc
    ];

    programs.starship = {
      enable = true;
      enableFishIntegration = true;
    };

    catppuccin.starship.enable = true;
  };
}
