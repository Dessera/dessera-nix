{ pkgs, ... }:

{
  dnix.programs = {
    direnv.enable = true;
    git.enable = true;
    neovim.enable = true;
    nh.enable = true;
    steam.enable = true;
    sudo-rs.enable = true;
  };

  programs = {
    fish.enable = true;
    nix-ld.enable = true;
  };

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

  hardware.nvidia-container-toolkit.enable = true;

  environment = {
    systemPackages = with pkgs; [
      podman-compose
      dive
      shadow

      wget
      fastfetch
    ];

    sessionVariables.NIXOS_OZONE_WL = "1";
  };
}
