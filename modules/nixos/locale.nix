{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.locale;
in
{
  options.dnix.locale = {
    enable = mkEnableOption "locale";
  };

  config = mkIf cfg.enable {
    time = {
      timeZone = "Asia/Shanghai";
    };

    i18n = {
      defaultLocale = "zh_CN.UTF-8";

      inputMethod = {
        enable = true;
        type = "fcitx5";
        fcitx5 = {
          addons = with pkgs; [
            (fcitx5-rime.override {
              rimeDataPkgs = [
                rime-data
                rime-ice
              ];
            })

            fcitx5-gtk
            fcitx5-lua
            qt6Packages.fcitx5-qt
            qt6Packages.fcitx5-configtool
            qt6Packages.fcitx5-chinese-addons

            fcitx5-tokyonight
          ];

          waylandFrontend = true;
        };
      };
    };
  };
}
