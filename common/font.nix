pkgs: {
  packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    sourceHanSansPackages.simplified-chinese
    sourceHanSerifPackages.simplified-chinese
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    wqy_zenhei

    # wps fix
    nur.repos.rewine.ttf-wps-fonts
  ];

  defaultFonts = {
    sansSerif = "思源黑体";
    serif = "思源宋体";
    emoji = "Noto Color Emoji";
    monospace = "JetBrainsMono Nerd Font Mono";
  };
}
