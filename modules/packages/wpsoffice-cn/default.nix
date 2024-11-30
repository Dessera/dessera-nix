{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.modules.packages.wpsoffice-cn;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.packages.wpsoffice-cn = {
    enable = mkEnableOption "Enable WPS Office";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = [
      (pkgs.callPackage ./__package/default.nix {
        qtbase = pkgs.qt5.qtbase;
        useChineseVersion = true;
      })
    ];
  };
}
