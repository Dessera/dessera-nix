_:
{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.packages.tmux;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.packages.tmux = {
    enable = mkEnableOption "Enable tmux";
  };

  config = mkIf cfg.enable {
    programs.tmux = {
      enable = true;
      clock24 = true;
      mouse = true;
      newSession = true;

      keyMode = "vi";
      customPaneNavigationAndResize = true;
    };
  };
}
