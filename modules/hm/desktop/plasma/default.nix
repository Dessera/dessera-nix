{
  meta,
  plasma-manager,
  mlib,
  ...
}:
{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.desktop.plasma;
  inherit (lib) mkEnableOption mkIf;

  toUpperInitial =
    str:
    let
      first = lib.substring 0 1 str;
      rest = lib.substring 1 (lib.stringLength str) str;
    in
    lib.concatStringsSep "" [
      (lib.toUpper first)
      rest
    ];

  themeCfg = {
    inherit (meta.appearance) flavor accent;
    flavorUpper = toUpperInitial themeCfg.flavor;
    accentUpper = toUpperInitial themeCfg.accent;
  };

  plasmaThemeCfg = {
    colorScheme = "Catppuccin${themeCfg.flavorUpper}${themeCfg.accentUpper}";
    lookAndFeel = "Catppuccin-${themeCfg.flavor}-${themeCfg.accent}";
    splashScreen = "Catppuccin-${themeCfg.flavorUpper}-${themeCfg.accentUpper}";
  };

  wallpaperPath = mlib.mkImage meta.appearance.background;
in
{
  imports =
    [
      plasma-manager.homeManagerModules.plasma-manager
    ]
    ++ (mlib.importModules [
      ./kwin/extra
    ]);

  options.modules.desktop.plasma = {
    enable = mkEnableOption "Enable plasma configuration";
  };

  config = mkIf cfg.enable {
    modules.packages = {
      alacritty.enable = true;
    };

    programs.plasma = {
      enable = true;
      workspace = {
        wallpaper = wallpaperPath;
        splashScreen = {
          engine = "KSplashQML";
          theme = plasmaThemeCfg.splashScreen;
        };
        colorScheme = plasmaThemeCfg.colorScheme;
        lookAndFeel = plasmaThemeCfg.lookAndFeel;
        iconTheme = "Papirus-Dark";
      };
      kscreenlocker = {
        appearance.wallpaper = wallpaperPath;
      };

      fonts = {
        general = {
          family = "Source Han Sans SC";
          pointSize = 10;
        };
        fixedWidth = {
          family = "MonaspiceNe Nerd Font Mono";
          pointSize = 10;
        };
        small = {
          family = "Source Han Sans SC";
          pointSize = 8;
        };
        toolbar = {
          family = "Source Han Sans SC";
          pointSize = 10;
        };
        menu = {
          family = "Source Han Sans SC";
          pointSize = 10;
        };
        windowTitle = {
          family = "Source Han Sans SC";
          pointSize = 10;
        };
      };

      input.keyboard = {
        numlockOnStartup = "on";
      };

      panels = import ./pannels.nix;
      hotkeys = import ./hotkeys.nix;

      window-rules = import ./window-rules;
      kwin = import ./kwin;
    };

    home.packages = with pkgs; [
      (catppuccin-kde.override {
        flavour = [ themeCfg.flavor ];
        accents = [ themeCfg.accent ];
      })

      papirus-icon-theme
    ];
  };
}
