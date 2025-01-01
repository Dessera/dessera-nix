{ pkgs, ... }:

{
  modules.packages = {
    git.enable = true;
    fish.enable = true;
    firefox.enable = true;
    vscode.nixcode = {
      nix = true;
    };
  };

  modules.desktop = {
    gtk.enable = true;
    plasma.enable = true;
    qt.enable = true;
  };

  programs = {
    home-manager.enable = true;
  };

  home.packages = with pkgs; [
    qq
    wechat-uos
    bilibili
    gimp
  ];
}
