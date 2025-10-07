{ pkgs, ... }:

{
  imports = [
    ../../components/hm/desktops/plasma6

    ../../components/hm/packages/vscode
    ../../components/hm/packages/firefox
    ../../components/hm/packages/fish.nix
  ];

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "Dessera";
      userEmail = "dessera@qq.com";
    };
  };

  home.packages = with pkgs; [
    qq
    wechat-uos

    libreoffice-fresh
    steam
    hmcl

    copier
    cachix

    inetutils
    openssl

    zulu # for minecraft
  ];
}
