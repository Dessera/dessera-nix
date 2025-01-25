_:
{ config, lib, ... }:

let
  cfg = config.modules.desktop.plasma;
  inherit (lib)
    mkOption
    mkEnableOption
    mkIf
    types
    ;
in
{
  options.modules.desktop.plasma = {
    enable = mkEnableOption "Enable plasma package";
    excludePackages = mkOption {
      type = types.listOf types.package;
      default = [ ];
      description = "List of packages to exclude from the plasma package";
    };
  };

  config = mkIf cfg.enable {
    services = {
      desktopManager.plasma6 = {
        enable = true;
      };
    };

    environment.plasma6.excludePackages = cfg.excludePackages;
  };
}
