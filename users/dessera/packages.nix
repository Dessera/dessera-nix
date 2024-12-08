{ pkgs, ... }:

{
  modules.packages = {
    git.enable = true;
    fish.enable = true;
    firefox.enable = true;
    vscode.enable = true;
  };

  programs = {
    home-manager.enable = true;
  };

  home.packages = with pkgs; [
    qq
    wechat-uos
  ];
}
