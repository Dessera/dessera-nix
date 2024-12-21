_: _:
{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.boot.grub;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.boot.grub = {
    enable = mkEnableOption "Enable grub";
    useOSProber = mkEnableOption "Enable os-prober";
    efiSupport = mkEnableOption "Enable EFI support";
  };

  config = mkIf cfg.enable {
    boot.loader.grub = {
      enable = true;
      device = "nodev";
      inherit (cfg) efiSupport useOSProber;
    };

    catppuccin.grub.enable = true;
  };
}
