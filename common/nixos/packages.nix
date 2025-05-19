{ pkgs, lib, ... }:

{
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
    git = {
      enable = true;
      lfs.enable = true;
    };
    fish.enable = true;
    command-not-found.enable = false;
  };

  security = {
    sudo-rs = {
      enable = true;
      execWheelOnly = true;
    };
    sudo.enable = false;
  };

  services = {
    desktopManager.plasma6.enable = true;
    displayManager.sddm = {
      enable = true;
      autoNumlock = true;
      wayland.enable = true;

      package = lib.mkForce pkgs.kdePackages.sddm;

      settings = {
        General = {
          InputMethod = null;
        };
      };
    };
  };

  catppuccin.sddm.enable = true;

  environment = {
    plasma6.excludePackages = with pkgs.kdePackages; [ xwaylandvideobridge ];
    systemPackages = with pkgs; [
      wget
      fastfetch
    ];
  };
}
