_: _:
{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.desktop.grub;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.desktop.grub = {
    enable = mkEnableOption "Enable grub theme";
  };

  config = mkIf cfg.enable {
    boot.loader.grub = {
      catppuccin.enable = true;
    };
  };
}
