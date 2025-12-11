{ pkgs, ... }:

{
  imports = [
    ../../components/hm/desktops/plasma6

    ../../components/hm/packages/vscode
    ../../components/hm/packages/firefox
    ../../components/hm/packages/zed.nix
    ../../components/hm/packages/fish.nix
    ../../components/hm/packages/wine.nix
  ];

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      settings = {
        user = {
          name = "Dessera";
          email = "dessera@qq.com";
        };
      };
    };
  };

  home.packages = with pkgs; [
    qq
    wechat-uos

    libreoffice-fresh
    steam

    copier
    cachix

    inetutils
    openssl

    hmcl
    zulu21

    gimp
    blockbench
  ];
}
