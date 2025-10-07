{ pkgs, ... }:

{
  imports = [
    ./starship.nix
  ];

  programs.fish =
    let
      useFishPlugin = p: { inherit (p) name src; };
    in
    {
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
        set -x fish_greeting
        set -x LANG zh_CN.UTF-8
      '';

      interactiveShellInit = ''
        if command -v eza >/dev/null 2>&1
          alias ls="eza --icons --group-directories-first"
          alias ll="eza -l --icons --group-directories-first"
          alias la="eza -a --icons --group-directories-first"
        end
      '';
    };

  home.packages = with pkgs; [
    grc
    fzf
    fd
    bat
    eza
  ];
}
