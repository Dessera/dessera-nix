{ pkgs, ... }:

let
  conf = import ../config.nix;
  fontOpt = import ../../common/font.nix pkgs;
in
{
  imports = [
    ./packages/vscode
    ./packages/firefox.nix
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

        interactiveShellInit = ''
          if command -v eza >/dev/null 2>&1
            alias ls="eza --icons --group-directories-first"
            alias ll="eza -l --icons --group-directories-first"
            alias la="eza -a --icons --group-directories-first"
          end
        '';
      };

    starship = {
      enable = true;
      enableFishIntegration = true;
      settings = builtins.fromTOML (builtins.readFile conf.starship);
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
    wechat-uos

    libreoffice-fresh
    wemeet
    feishu
    steam
    hmcl

    copier
    cachix

    grc
    fzf
    fd
    bat
    eza

    inetutils
    openssl

    zulu # for minecraft
  ];
}
