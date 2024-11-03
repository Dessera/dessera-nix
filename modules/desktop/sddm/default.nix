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
        theme = "catppuccin-mocha";
        autoNumlock = true;
        settings = {
          General = {
            InputMethod = null;
          };
        };
      };
    };

    environment.systemPackages = with pkgs; [
      (catppuccin-sddm.override {
        flavor = "mocha";
      })
    ];
  };
}
