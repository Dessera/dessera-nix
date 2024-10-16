{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.packages.plasma;
  inherit (lib) mkEnableOption mkIf;

  generalTheme = import ./general pkgs;
in
{
  options.modules.packages.plasma = {
    enable = mkEnableOption "Enable plasma configuration";
  };

  config = mkIf cfg.enable {
    programs.plasma = {
      enable = true;
      workspace = {
        wallpaper = ./background.jpg;
        lookAndFeel = "Catppuccin-Mocha-Flamingo";
        colorScheme = "CatppuccinMochaFlamingo";
        cursor = {
          theme = "catppuccin-mocha-dark-cursors";
          size = 30;
        };
        iconTheme = "Fluent-orange";
      };
      panels = [
        (import ./pannels/dock.nix)
        (import ./pannels/app-menu.nix)
      ];
    };

    programs.konsole = {
      enable = true;
      defaultProfile = "default";
      profiles = {
        default = {
          font = {
            size = 16;
          };
        };
      };
    };

    gtk = import ./themes/gtk.nix {
      inherit generalTheme;
    };
    # gtk = {
    #   enable = true;
    #   theme = {
    #     name = "catppuccin-mocha-flamingo-standard";
    #     package = pkgs.catppuccin-gtk.override {
    #       accents = [ "flamingo" ];
    #       variant = "mocha";
    #     };
    #   };
    #   iconTheme = {
    #     name = "Fluent-orange";
    #     package = pkgs.fluent-icon-theme.override {
    #       colorVariants = [ "orange" ];
    #     };
    #   };
    # };

    home.packages = with pkgs; [
      catppuccin-cursors.mochaDark
      (catppuccin-kde.override {
        flavour = [ "mocha" ];
        accents = [ "flamingo" ];
      })
    ];
  };
}
