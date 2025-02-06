{ pkgs, ... }:

let
  fontOpt = import ../../common/font.nix pkgs;
in
{
  modules.packages = {
    git.enable = true;
    ghostty.enable = true;
    konsole = {
      enable = true;
      font.family = fontOpt.defaultFonts.monospace;
    };
    fish.enable = true;
    firefox.enable = true;
    vscode.nixcode = {
      nix = true;
    };
  };

  programs = {
    home-manager.enable = true;
  };

  home.packages = with pkgs; [
    qq
    wechat-uos
    gimp
    yakuake
  ];
}
