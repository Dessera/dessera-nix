{ pkgs-stable, pkgs, ... }:

{
  modules.packages = {
    git.enable = true;
    fish.enable = true;
    podman = {
      enable = true;
      enableNvidiaSupport = true;
    };
  };

  modules.desktop = {
    plasma = {
      enable = true;
      excludePackages = with pkgs.kdePackages; [ xwaylandvideobridge ];
    };
    sddm.enable = true;
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

  security = {
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
    };
    sudo.enable = false;
  };

  environment.systemPackages = with pkgs; [
    wget
    fastfetch
    pkgs-stable.qemu_full

    nur.repos.novel2430.wpsoffice-365
  ];
}
