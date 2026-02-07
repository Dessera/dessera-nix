{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.desktops.plasma6;

  catppuccinCfg = config.catppuccin;
  xdgCfg = config.xdg;

  splashScreenTheme = "Catppuccin-${lib.dnix.toUpperInitial catppuccinCfg.flavor}-${lib.dnix.toUpperInitial catppuccinCfg.accent}";
in
{
  imports = [
    ./panels.nix
    ./kwin.nix
    ./binding.nix
    ./application.nix
  ];

  options.dnix.desktops.plasma6 = {
    enable = mkEnableOption "plasma6";
  };

  config = mkIf cfg.enable {
    programs.plasma = {
      enable = true;
      session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
    };

    stylix.targets.qt.enable = false;

    home = {
      packages = with pkgs; [
        (catppuccin-kde.override {
          flavour = [ catppuccinCfg.flavor ];
          accents = [ catppuccinCfg.accent ];
        })
      ];

      # Script from `stylixLookAndFeel` will remove all theme configuration,
      # So I've managed to use this activation to override splash.
      activation.desseraSetKSplash = lib.hm.dag.entryAfter [ "writeBoundary" "stylixLookAndFeel" ] ''
        run printf "[KSplash]\nTheme=${splashScreenTheme}\n" \
          > ${xdgCfg.configHome}/ksplashrc \
          || verboseEcho "Failed to set splash screen."
      '';
    };
  };
}
