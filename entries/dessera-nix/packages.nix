{ pkgs, ... }:

{
  # programs.clash-verge = {
  #   enable = true;
  #   tunMode = true;
  #   package = pkgs.clash-verge-rev;
  # };
  modules.packages = {
    clash = {
      enable = true;
    };
  };

  programs.gnupg = {
    agent.enable = true;
  };

  programs.fish.enable = true;

  programs.git = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    wget

    git-crypt

    neofetch
    direnv
    glxinfo
    tree

    # (callPackage ../../packages/emacs/default.nix { })
  ];

}
