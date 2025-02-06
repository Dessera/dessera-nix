{ pkgs, ... }:

let
  mkFontOpt = family: pointSize: {
    inherit family pointSize;
  };
in
{
  modules.packages = {
    git.enable = true;
    ghostty.enable = true;
    konsole = {
      enable = true;
      font.family = "JetBrainsMono Nerd Font Mono";
    };
    fish.enable = true;
    firefox.enable = true;
    vscode.nixcode = {
      nix = true;
    };
  };

  modules.desktop = {
    gtk.enable = true;
    plasma = {
      enable = true;
      defaultApplications = {
        terminal = {
          application = "yakuake";
          service = "org.kde.yakuake.desktop";
        };
      };
      dockApplications = [
        "applications:org.kde.dolphin.desktop"
        "applications:org.kde.yakuake.desktop"
        "applications:code.desktop"
        "applications:firefox.desktop"
        "applications:org.kde.spectacle.desktop"
        "applications:systemsettings.desktop"
      ];
      fonts = {
        general = mkFontOpt "Source Han Sans SC" 12;
        fixedWidth = mkFontOpt "JetBrainsMono Nerd Font Mono" 10;
        small = mkFontOpt "Source Han Sans SC" 8;
        toolbar = mkFontOpt "Source Han Sans SC" 10;
        menu = mkFontOpt "Source Han Sans SC" 10;
        windowTitle = mkFontOpt "Source Han Sans SC" 10;
      };
    };
    qt.enable = true;
  };

  programs = {
    home-manager.enable = true;
  };

  home.packages = with pkgs; [
    qq
    wechat-uos
    # bilibili
    gimp
    yakuake
  ];
}
