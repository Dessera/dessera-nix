{ inputs, pkgs, ... }:

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
    nixcode = {
      enable = true;
      modules = [ inputs.nixcode.nixcodeProfiles.nix ];
    };
  };

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    qq
    # wechat-uos
    nur.repos.linyinfeng.wemeet

    gimp

    copier
    cachix
  ];
}
