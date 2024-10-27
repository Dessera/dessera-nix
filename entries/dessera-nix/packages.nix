{ pkgs, ... }:

{
  modules.packages = {
    # clash.enable = true;
    git.enable = true;
    fish.enable = true;
    podman.enable = true;
    plasma.enable = true;
  };

  programs = {
    direnv = {
      enable = true;
    };
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    fastfetch
    qemu_full
    quickemu
  ];
}
