{ pkgs, ... }:

{
  imports = [
    ../../components/nixos/desktops/plasma6.nix

    ../../components/nixos/packages/v2raya.nix
    ../../components/nixos/packages/direnv.nix
    ../../components/nixos/packages/fish.nix
    ../../components/nixos/packages/git.nix
    ../../components/nixos/packages/neovim.nix
    ../../components/nixos/packages/sudo-rs.nix
  ];

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
