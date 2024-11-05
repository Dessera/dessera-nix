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
      syntaxHighlighting = {
        enable = true;
      };

      zplug = {
        enable = true;
        plugins = [
          { name = "zsh-users/zsh-autosuggestions"; }
          {
            name = "spaceship-prompt/spaceship-prompt";
            tags = [
              "use:spaceship.zsh"
              "from:github"
              "as:theme"
            ];
          }
          {
            name = "hlissner/zsh-autopair";
            tags = [ "defer:2" ];
          }
        ];
      };
    };
  };
}
