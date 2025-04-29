{ pkgs, ... }:

let
  fontOpt = import ../../common/font.nix pkgs;
in
{
  modules.packages = {
    git.enable = true;
    konsole = {
      enable = true;
      font.family = fontOpt.defaultFonts.monospace;
    };
    fish.enable = true;
    firefox = {
      enable = true;
      bookmarks = import ../../common/bookmarks.nix;
    };
    vscode.enable = true;
  };

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    qq
    gimp
    copier
    cachix
  ];
}
