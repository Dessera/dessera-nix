{ config, lib, ... }:

let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.dnix.system.gc;
in
{
  options.dnix.system.gc = {
    enable = mkEnableOption "gc";
  };

  config = mkIf cfg.enable {
    services.angrr = {
      enable = true;
      settings = {
        temporary-root-policies = {
          direnv = {
            path-regex = "/\\.direnv/";
            period = "7d";
          };
          result = {
            path-regex = "/result[^/]*$";
            period = "7d";
          };
        };
        profile-policies = {
          system = {
            profile-paths = [ "/nix/var/nix/profiles/system" ];
            keep-since = "7d";
            keep-booted-system = true;
            keep-current-system = true;
          };
          user = {
            profile-paths = [
              "~/.local/state/nix/profiles/profile"
              "/nix/var/nix/profiles/per-user/root/profile"
            ];
            keep-since = "7d";
          };
        };
      };
    };

    nix.gc.automatic = true;
    nix.optimise.automatic = true;
  };
}
