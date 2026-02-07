{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.catppuccin;
in
{
  options.dnix.catppuccin = {
    enable = mkEnableOption "catppuccin";
  };

  config = mkIf cfg.enable {
    catppuccin = {
      accent = "mauve";
      flavor = "mocha";
    };
  };
}
