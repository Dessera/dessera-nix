{ config, pkgs, lib, ... }:

let
  cfg = config.modules.packages.wpsoffice-cn;
in
{
  options.modules.packages.wpsoffice-cn = {
    enable = lib.mkEnableOption "Enable WPS Office";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      (pkgs.callPackage ./__package/default.nix {
        qtbase = pkgs.qt5.qtbase;
        useChineseVersion = true;
      })
    ];
  };
}
