{
  meta,
  plasma-manager,
  mlib,
  ...
}:
{
  config,
  lib,
  ...
}:

let
  cfg = config.modules.desktop.plasma;
  inherit (lib) mkEnableOption mkIf;

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
      catppuccin-extra.enable = true;

      workspace = {
        wallpaper = wallpaperPath;
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
  };
}
