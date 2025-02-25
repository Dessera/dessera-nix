{ pkgs, ... }:

{
  modules.packages = {
    git.enable = true;
    fish.enable = true;
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
    command-not-found.enable = false;
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

    nur.repos.novel2430.wpsoffice-365
  ];
}
