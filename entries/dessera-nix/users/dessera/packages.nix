{ pkgs, pkgs-master, ... }:

{
  programs.vscode.enable = true;
  services.vscode-server.enable = true;

  modules.packages = {
    wpsoffice-cn.enable = true;
    git.enable = true;
    fish.enable = true;
    zsh.enable = true;
    firefox.enable = true;
  };

  programs = {
    home-manager.enable = true;
  };

  home.packages = with pkgs; [
    pkgs-master.qq
    wechat-uos
    nur.repos.linyinfeng.wemeet
    emacs
  ];
}
