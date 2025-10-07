{ config, pkgs, ... }:
{
  stylix = {
    enable = true;

    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";
    image = ../../assets/noshared/83050349_p0.png;
    icons = {
      enable = true;
      package = pkgs.papirus-icon-theme;
      dark = "Papirus-Dark";
      light = "Papirus-Light";
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    fonts = {
      serif = config.stylix.fonts.sansSerif;

      sansSerif = {
        package = pkgs.sourceHanSansPackages.simplified-chinese;
        name = "思源黑体";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };

    targets = {
      grub.enable = false;
    };
  };
}
