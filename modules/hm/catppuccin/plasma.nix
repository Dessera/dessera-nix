{
  config,
  lib,
  pkgs,
  ...
}:
let
  inherit (config.catppuccin) flavor accent;
  inherit (pkgs.externLibs) toUpperInitial;

  cfg = config.programs.plasma.catppuccin-ext;

  colorScheme = "Catppuccin${toUpperInitial flavor}${toUpperInitial accent}";
  lookAndFeel = "Catppuccin-${toUpperInitial flavor}-${toUpperInitial accent}";
in
{
  options.programs.plasma.catppuccin-ext = {
    enable = lib.mkEnableOption "Enable Catppuccin configuration for Plasma";
  };

  config = lib.mkIf cfg.enable {
    programs.plasma.workspace = {
      inherit colorScheme lookAndFeel;
      iconTheme = "Papirus-Dark";
    };

    home.packages = with pkgs; [
      (catppuccin-kde.override {
        flavour = [ flavor ];
        accents = [ accent ];
      })

      papirus-icon-theme
    ];
  };
}
