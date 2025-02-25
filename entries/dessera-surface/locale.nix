{ pkgs, ... }:

{
  time = {
    timeZone = "Asia/Shanghai";
  };

  i18n = {
    defaultLocale = "zh_CN.UTF-8";

    inputMethod = {
      enable = true;
      type = "ibus";
      ibus.engines = with pkgs.ibus-engines; [
        libpinyin
      ];
    };
  };
}
