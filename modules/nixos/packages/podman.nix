_:
{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.modules.packages.podman;
  inherit (lib) mkEnableOption mkIf;
in
{
  options.modules.packages.podman = {
    enable = mkEnableOption "Enable podman and related tools";
    enableNvidiaSupport = mkEnableOption "Enable nvidia support";
  };

  config = mkIf cfg.enable {
    virtualisation = {
      containers.enable = true;
      podman = {
        enable = true;
        dockerCompat = true;

        defaultNetwork = {
          settings = {
            dns_enabled = true;
          };
        };
      };
    };

    hardware.nvidia-container-toolkit.enable = cfg.enableNvidiaSupport;

    environment.systemPackages = with pkgs; [
      podman-compose
      dive
      shadow
    ];
  };
}
