{ pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      nerd-fonts.monaspace
      sourceHanSansPackages.simplified-chinese
      sourceHanSerifPackages.simplified-chinese
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      vistafonts-chs
      wqy_zenhei

      # wps fix
      nur.repos.rewine.ttf-wps-fonts
    ];
    fontDir.enable = true;
    fontconfig = {
      enable = true;
      defaultFonts = {
        sansSerif = [ "Source Han Sans SC" ];
        serif = [ "Source Han Serif SC" ];
        emoji = [ "Noto Color Emoji" ];
        monospace = [
          "MonaspiceNe Nerd Font Mono"
          "JetBrainsMono Nerd Font Mono"
        ];
      };
      cache32Bit = true;
    };
  };
}
