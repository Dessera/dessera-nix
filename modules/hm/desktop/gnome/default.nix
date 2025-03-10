{ mlib, meta, ... }:
{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.desktop.gnome;
  inherit (lib)
    mkEnableOption
    mkOption
    mkIf
    types
    ;

  wallpaperPath = mlib.mkImage meta.appearance.background;

  mkFontOption = name: defaultName: defaultSize: {
    name = mkOption {
      type = types.str;
      default = defaultName;
      description = "Font ${name} family";
    };
    size = mkOption {
      type = types.int;
      default = defaultSize;
      description = "Font ${name} size";
    };
  };

  mkFontDconf = { name, size }: "${name} ${builtins.toString size}";
in
{

  options.modules.desktop.gnome = {
    enable = mkEnableOption "Enable gnome configuration";

    fonts = {
      interface = mkFontOption "interface" "Noto Sans" 12;
      document = mkFontOption "document" "Noto Sans" 12;
      monospace = mkFontOption "monospace" "Noto Sans Mono" 10;
    };

    dockApplications = mkOption {
      type = types.listOf types.str;
      default = [ ];
      description = "Applications to display in dock";
    };
  };

  config = mkIf cfg.enable {
    programs.gnome.catppuccin-extra.enable = true;

    home.packages =
      (with pkgs.gnomeExtensions; [
        app-menu-is-back
        appindicator
        dash-to-dock
      ])
      ++ (with pkgs; [ gnome-tweaks ]);

    dconf.settings = {
      "org/gnome/shell" = {
        enabled-extensions = [
          "appmenu-is-back@fthx"
          "dash-to-dock@micxgx.gmail.com"
          "appindicatorsupport@rgcjonas.gmail.com"
          "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
        ];
        favorite-apps = cfg.dockApplications;
      };

      "org/gnome/desktop/background" = {
        picture-uri = "file://${wallpaperPath}";
        picture-uri-dark = "file://${wallpaperPath}";
      };

      "org/gnome/desktop/interface" = {
        font-name = mkFontDconf cfg.fonts.interface;
        document-font-name = mkFontDconf cfg.fonts.document;
        monospace-font-name = mkFontDconf cfg.fonts.monospace;
      };
    };
  };
}
