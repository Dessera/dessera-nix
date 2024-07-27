{ pkgs, ... }:

{
  time.timeZone = "Asia/Shanghai";
  time.hardwareClockInLocalTime = true;
  i18n = {
    defaultLocale = "zh_CN.UTF-8";

    inputMethod = {
      enabled = "fcitx5";
      fcitx5 = {
        addons = [
          pkgs.fcitx5-rime
          pkgs.fcitx5-mozc
          pkgs.fcitx5-gtk
          pkgs.fcitx5-qt
          pkgs.fcitx5-configtool
          pkgs.fcitx5-chinese-addons
        ];
        waylandFrontend = true;
      };
    };
  };
}
