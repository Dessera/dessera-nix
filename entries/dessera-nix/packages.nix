{ pkgs, ... }:

{
  modules.packages = {
    git.enable = true;
    fish.enable = true;
    podman.enable = true;
    xilinx-dev.enable = true;
  };

  modules.desktop = {
    plasma.enable = true;
    sddm.enable = true;
    plymouth.enable = true;
    grub.enable = true;
  };

  programs = {
    direnv = {
      enable = true;
      enableFishIntegration = true;
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
  ];
}
