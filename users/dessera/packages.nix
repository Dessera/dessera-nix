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
    fish.enable = true;
    # alacritty.enable = true;
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
          application = "ghostty";
          service = "com.mitchellh.ghostty.desktop";
        };
      };
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
  ];
}
