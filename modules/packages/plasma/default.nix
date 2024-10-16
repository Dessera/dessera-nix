{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.packages.plasma;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.packages.plasma = {
    enable = mkEnableOption "Enable plasma package";
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

      desktopManager.plasma6 = {
        enable = true;
      };
    };

    environment.systemPackages = with pkgs; [
      (catppuccin-sddm.override {
        flavor = "mocha";
      })
    ];
  };
}
