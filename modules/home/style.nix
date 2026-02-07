{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.style;
in
{
  options.dnix.style = {
    enable = mkEnableOption "style";
  };

  config = mkIf cfg.enable {
    stylix = {
      icons = {
        enable = true;
        package = pkgs.papirus-icon-theme;
        dark = "Papirus-Dark";
        light = "Papirus-Light";
      };

      targets = {
        firefox.profileNames = [ "default" ];
        vscode.profileNames = [
          "Cpp"
          "Java"
          "Python"
          "Rust"
          "Web"
          "Zig"
          "Nix"
          "default"
        ];
        qt.enable = false;
      };
    };

    catppuccin = {
      accent = "mauve";
      flavor = "mocha";
    };
  };
}
