{ pkgs, ... }:

{
  dnix.programs = {
    firefox.enable = true;
    vscode.enable = true;
    fish.enable = true;
    git.enable = true;
  };

  programs = {
    home-manager.enable = true;
    starship.enable = true;
  };

  home.packages = with pkgs; [
    qq
    wechat

    copier
    cachix

    inetutils
    openssl
    zulu21
    winetricks
    wineWowPackages.waylandFull

    hmcl

    gimp
    blockbench

    vnote
    vlc
    libreoffice-fresh

    dix
  ];

}
