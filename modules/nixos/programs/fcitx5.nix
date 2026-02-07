{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.programs.fcitx5;
in
{
  options.dnix.programs.fcitx5 = {
    enable = mkEnableOption "fcitx5";
  };

  config = mkIf cfg.enable {
    i18n.inputMethod = {
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
}
