{ pkgs, ... }:

let
  fontOpt = import ../../common/font.nix pkgs;
in
{
  imports = [
    ./vscode
    ./firefox
  ];

  programs = {
    home-manager.enable = true;

    fish =
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
      };

    starship = {
      enable = true;
      enableFishIntegration = true;
    };

    konsole = {
      enable = true;
      catppuccin.enable = true;

      defaultProfile = "default";

      profiles.default = {
        font = {
          name = fontOpt.defaultFonts.monospace;
          size = 16;
        };
      };
    };

    git = {
      enable = true;
      userName = "Dessera";
      userEmail = "dessera@qq.com";
    };
  };

  catppuccin.starship.enable = true;

  home.packages = with pkgs; [
    qq
    gimp
    copier
    cachix

    grc
    fzf
    fd
    bat
  ];
}
