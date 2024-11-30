{
  config,
  lib,
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
      enableBashCompletion = true;

      autosuggestions = {
        enable = true;
        async = true;
        strategy = [
          "history"
          "completion"
        ];
      };
      syntaxHighlighting = {
        enable = true;
      };
    };

    environment.pathsToLink = [
      "/share/zsh"
    ];
  };
}
