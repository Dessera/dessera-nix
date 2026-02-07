{ pkgs, ... }:

{
  dnix.programs = {
    direnv.enable = true;
    fcitx5.enable = true;
    git.enable = true;
    neovim.enable = true;
    nh.enable = true;
    podman.enable = true;
    steam.enable = true;
    sudo-rs.enable = true;
  };

  programs = {
    fish.enable = true;
    nix-ld.enable = true;
  };

  environment.systemPackages = with pkgs; [
    wget
    fastfetch
  ];
}
