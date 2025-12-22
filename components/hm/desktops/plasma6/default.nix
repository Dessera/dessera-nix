{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (config.catppuccin) flavor accent;
  xdgCfg = config.xdg;

  toUpperInitial =
    str:
    let
      first = lib.substring 0 1 str;
      rest = lib.substring 1 (lib.stringLength str) str;
    in
    lib.concatStrings [
      (lib.toUpper first)
      rest
    ];

  splashScreenTheme = "Catppuccin-${toUpperInitial flavor}-${toUpperInitial accent}";
in
{
  imports = [
    ./panels.nix
    ./kwin.nix
    ./binding.nix
    ./application.nix

    ../../packages/wezterm.nix
    ../../packages/fuzzel.nix
  ];

  programs.plasma = {
    enable = true;
    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
  };

  home = {
    packages = with pkgs; [
      (catppuccin-kde.override {
        flavour = [ flavor ];
        accents = [ accent ];
      })
      kdePackages.kzones
    ];

    # Because script from `stylixLookAndFeel` will remove all theme
    # configuration, So I've managed to use this activation to override splash.
    activation.desseraSetKSplash = lib.hm.dag.entryAfter [ "writeBoundary" "stylixLookAndFeel" ] ''
      run printf "[KSplash]\nTheme=${splashScreenTheme}\n" \
        > ${xdgCfg.configHome}/ksplashrc \
        || verboseEcho "Failed to set splash screen."
    '';
  };
}
