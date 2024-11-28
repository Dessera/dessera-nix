{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.desktop.sddm;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.desktop.sddm = {
    enable = mkEnableOption "Enable sddm package";
  };

  config = mkIf cfg.enable {
    services = {
      displayManager.sddm = {
        enable = true;
        theme = "where-is-my-sddm-theme";
        autoNumlock = true;
        settings = {
          General = {
            InputMethod = null;
          };
        };
      };
    };

    environment.systemPackages = [
      (pkgs.catppuccin-sddm.override {
        flavor = "mocha";
      })
      pkgs.sddm-astronaut
      (pkgs.where-is-my-sddm-theme.override {
        # from where-is-my-sddm-theme.conf
        themeConfig = lib.importTOML ./where-is-my-sddm-theme.conf;
      })
    ];
  };
}
