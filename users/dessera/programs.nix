{ pkgs, ... }:

{
  imports = [
    ../../components/hm/desktops/plasma6

    ../../components/hm/packages/firefox
    ../../components/hm/packages/fish.nix
    ../../components/hm/packages/wine.nix
  ];

  dnix.programs = {
    vscode.enable = true;
  };

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
    wechat

    copier
    cachix

    inetutils
    openssl
    zulu21

    hmcl

    gimp
    blockbench

    vnote
    vlc
    libreoffice-fresh

    dix
  ];

  home.dockApps = [
    "applications:systemsettings.desktop"
    "applications:org.kde.dolphin.desktop"
    "applications:org.kde.plasma-systemmonitor.desktop"
    "applications:org.wezfurlong.wezterm.desktop"
    "applications:vnote.desktop"
    "applications:code.desktop"
    "applications:firefox.desktop"
    "applications:steam.desktop"
    "applications:org.kde.spectacle.desktop"
    "applications:qq.desktop"
    "applications:wechat.desktop"
    "applications:vlc.desktop"
  ];
}
