_:
{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.desktop.plasma;
  inherit (lib) mkIf;
in
{
  config = mkIf cfg.enable {
    programs.plasma.configFile = {
      # im fix (fcitx5)
      # TODO: Should be flexible
      kwinrc.Wayland."InputMethod" =
        "/run/current-system/sw/share/applications/fcitx5-wayland-launcher.desktop";
    };
  };
}
