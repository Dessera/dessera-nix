{ config, pkgs, lib, ... }:

let
  cfg = config.modules.packages.git;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.packages.git = {
    enable = mkEnableOption "Enable git";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      lfs.enable = true;
    };

    programs.gnupg = {
      agent.enable = true;
    };

    environment.systemPackages = with pkgs; [
      git-crypt
    ];
  };
}
