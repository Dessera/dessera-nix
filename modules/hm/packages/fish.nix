_:
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
  inherit (pkgs) fetchFromGitHub;
in
{
  options.modules.packages.fish = {
    enable = mkEnableOption "Enable fish";
  };

  config = mkIf cfg.enable {
    modules.packages = {
      tmux.enable = true;
    };

    programs.fish = {
      enable = true;
      plugins = [
        { inherit (pkgs.fishPlugins.grc) name src; }
        { inherit (pkgs.fishPlugins.pisces) name src; }
        { inherit (pkgs.fishPlugins.plugin-git) name src; }
        { inherit (pkgs.fishPlugins.sponge) name src; }
        {
          name = "tmux.fish";
          src = fetchFromGitHub {
            owner = "budimanjojo";
            repo = "tmux.fish";
            rev = "v2.0.1";
            sha256 = "sha256-ynhEhrdXQfE1dcYsSk2M2BFScNXWPh3aws0U7eDFtv4=";
          };
        }
      ];

      shellInit = ''
        # disable fish_greeting
        set -x fish_greeting
        # LANG
        set -x LANG ${meta.locale.language}
      '';

      interactiveShellInit = ''
        # tmux.fish
        set fish_tmux_autostart true
      '';
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
