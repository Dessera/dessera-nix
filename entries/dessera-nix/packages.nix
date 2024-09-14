{ pkgs, ... }:

{
  modules.packages = {
    clash = {
      enable = true;
    };
    git = {
      enable = true;
    };
  };

  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    wget

    neofetch
    direnv
    glxinfo
    tree

    # (callPackage ../../packages/emacs/default.nix { })
  ];

}
