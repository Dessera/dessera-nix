{
  config,
  lib,
  meta,
  ...
}:

let
  cfg = config.modules.packages.git;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.packages.git = {
    enable = mkEnableOption "Enable git";
  };

  config = mkIf cfg.enable {
    programs.git = with meta; {
      enable = true;
      userName = author.name;
      userEmail = author.email;
    };
  };
}
