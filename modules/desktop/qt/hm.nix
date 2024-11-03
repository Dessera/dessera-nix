{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.desktop.qt;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.desktop.qt = {
    enable = mkEnableOption "Enable qt configuration";
  };

  config = mkIf cfg.enable {
    qt = {
      enable = true;
      platformTheme = {
        name = "kde";
      };
    };
  };
}
