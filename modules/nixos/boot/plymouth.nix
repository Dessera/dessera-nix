_: _:
{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.boot.plymouth;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.boot.plymouth = {
    enable = mkEnableOption "Enable plymouth package";
  };

  config = mkIf cfg.enable {
    boot.plymouth = {
      enable = true;
      catppuccin.enable = true;
    };
  };
}
