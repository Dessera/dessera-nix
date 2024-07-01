{ pkgs, config, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
      source-han-sans
      source-han-serif
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      vistafonts-chs
      wqy_zenhei

      # wps fix
      config.nur.repos.rewine.ttf-wps-fonts
    ];
    fontDir.enable = true;
    fontconfig = {
      enable = true;
      defaultFonts = {
        sansSerif = [ "Source Han Sans SC" ];
        serif = [ "Source Han Serif SC" ];
        emoji = [ "Noto Color Emoji" ];
        monospace = [ "FiraCode Nerd Font Mono" ];
      };
      cache32Bit = true;
    };
  };
}
