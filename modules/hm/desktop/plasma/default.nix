{ importModules, ... }:
{
  meta,
  plasma-manager,
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
  catppuccinCfg = config.catppuccin;
  inherit (lib) mkEnableOption mkIf;

  catppuccinFlavor = catppuccinCfg.flavor or "mocha";
  catppuccinAccent = catppuccinCfg.accent or "mauve";
  catppuccinFlavorUpper = lib.toUpper catppuccinFlavor;
  catppuccinAccentUpper = lib.toUpper catppuccinAccent;

  plasmaColorScheme = "Catppuccin${catppuccinFlavorUpper}${catppuccinAccentUpper}";
  plasmaLookAndFeel = "Catppuccin-${catppuccinFlavor}-${catppuccinAccent}";
in
{
  imports =
    [
      plasma-manager.homeManagerModules.plasma-manager

    ]
    ++ (importModules [
      # extra effects
      ./kwin/effects/extra
    ]);

  options.modules.desktop.plasma = {
    enable = mkEnableOption "Enable plasma configuration";
  };

  config = mkIf cfg.enable {

    programs.konsole = {
      enable = true;
      defaultProfile = "default";
      profiles = {
        default = {
          colorScheme = "catppuccin-mocha";
          font = {
            size = 16;
          };
        };
      };
    };

    # TODO: Should be a package
    xdg.dataFile."konsole/catppuccin-mocha.colorscheme".source = ./catppuccin-mocha.colorscheme;

    programs.plasma = {
      enable = true;
      workspace = {
        wallpaper = meta.appearance.background;
        colorScheme = plasmaColorScheme;
        lookAndFeel = plasmaLookAndFeel;
        iconTheme = "Papirus-Dark";
      };
      kscreenlocker = {
        appearance.wallpaper = meta.appearance.background;
      };

      panels = import ./pannels;
      window-rules = import ./window-rules;

      kwin = import ./kwin;
    };

    home.packages = with pkgs; [
      (catppuccin-kde.override {
        flavour = [ catppuccinFlavor ];
        accents = [ catppuccinAccent ];
      })

      papirus-icon-theme
    ];
  };
}
