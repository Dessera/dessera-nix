{ pkgs, ... }:

{
  i18n = {
    inputMethod = {
      enabled = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-rime
          fcitx5-mozc
          fcitx5-gtk
          fcitx5-configtool
          fcitx5-chinese-addons
        ];
      };
    };
  };

  home.packages = with pkgs; [
    fcitx5-material-color
  ];
}
