{
  config,
  lib,
  user,
  ...
}:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.programs.git;
in
{
  options.dnix.programs.git = {
    enable = mkEnableOption "git";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      settings = {
        user = {
          inherit (user) name email;
        };
      };
    };
  };
}
