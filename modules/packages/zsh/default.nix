{ config, lib, ... }:

let
  cfg = config.modules.packages.zsh;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.packages.zsh = {
    enable = mkEnableOption "Enable zsh";
  };

  config = mkIf cfg.enable {
    programs.zsh = {
      enable = true;

      enableCompletion = true;
      autosuggestions = {
        enable = true;
      };
      syntaxHighlighting = {
        enable = true;
      };
    };
  };
}
