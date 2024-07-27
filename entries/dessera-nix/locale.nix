{ pkgs, ... }:

{
  time.timeZone = "Asia/Shanghai";
  time.hardwareClockInLocalTime = true;
  i18n = {
    defaultLocale = "zh_CN.UTF-8";

    inputMethod = {
      enabled = "fcitx5";
      fcitx5 = {
        addons = with pkgs; [
          fcitx5-rime
          fcitx5-mozc
          fcitx5-gtk
          qt6Packages.fcitx5-qt
          fcitx5-configtool
          fcitx5-chinese-addons
        ];
        waylandFrontend = true;
      };
    };
  };
}
