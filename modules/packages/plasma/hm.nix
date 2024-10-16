{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.packages.plasma;
  inherit (lib) mkEnableOption mkIf;

  generalTheme = import ./general pkgs;
in
{
  options.modules.packages.plasma = {
    enable = mkEnableOption "Enable plasma configuration";
  };

  config = mkIf cfg.enable {

    programs.konsole = {
      enable = true;
      defaultProfile = "default";
      profiles = {
        default = {
          font = {
            size = 16;
          };
        };
      };
    };

    programs.plasma = import ./themes/plasma.nix {
      inherit generalTheme;
    };

    gtk = import ./themes/gtk.nix {
      inherit generalTheme;
    };

    qt = import ./themes/qt.nix {
      inherit generalTheme;
    };

    home.packages = generalTheme.packages;
  };
}
