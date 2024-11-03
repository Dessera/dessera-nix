{
  config,
  lib,
  pkgs,
  ...
}:

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
        strategy = [
          "history"
          "completion"
        ];
      };
      syntaxHighlighting = {
        enable = true;
      };
    };
  };
}
