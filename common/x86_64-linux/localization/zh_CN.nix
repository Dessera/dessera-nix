{ pkgs, ... }:

{
  time.timeZone = "Asia/Shanghai";
  i18n = {
    defaultLocale = "zh_CN.UTF-8";
    inputMethod = {
      enabled = "fcitx5";
      fcitx5 = {
        # plasma6Support = true;
        addons = with pkgs; [
          fcitx5-rime
          fcitx5-configtool
          fcitx5-chinese-addons
        ];
      };
    };
  };
}
