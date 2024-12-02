_: _:
{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.desktop.plymouth;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.desktop.plymouth = {
    enable = mkEnableOption "Enable plymouth package";
  };

  config = mkIf cfg.enable {
    boot.plymouth = {
      enable = true;
      catppuccin.enable = true;
    };
  };
}
