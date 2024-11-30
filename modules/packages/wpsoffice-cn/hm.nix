_:
{ ... }:
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
    home.packages = [
      (pkgs.callPackage ./__package/default.nix {
        qtbase = pkgs.qt5.qtbase;
        useChineseVersion = true;
      })
    ];
  };
}
