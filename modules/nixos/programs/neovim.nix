{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.programs.neovim;
in
{
  options.dnix.programs.neovim = {
    enable = mkEnableOption "neovim";
  };

  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
  };
}
