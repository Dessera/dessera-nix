{ pkgs, ... }:

{
  programs.clash-verge = {
    enable = true;
    tunMode = true;
    package = pkgs.clash-verge-rev;
  };

  programs.gnupg = {
    agent.enable = true;
  };

  programs.fish.enable = true;

  programs.steam = {
    enable = true;
    fontPackages = with pkgs; [
      source-han-sans
    ];
  };

  programs.git = {
    enable = true;
  };

  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    helix
    onlyoffice-bin

    wget

    git-crypt

    neofetch
    direnv
    glxinfo
    tree
  ];

}
