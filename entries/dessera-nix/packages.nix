{ pkgs, ... }:

{
  imports = [
    ../../common/x86_64-linux/packages/clash-verge-rev.nix
    ../../common/x86_64-linux/packages/gnupg/system.nix
    ../../common/x86_64-linux/packages/fish/system.nix
    ../../common/x86_64-linux/packages/steam/system.nix
  ];

  environment.systemPackages = with pkgs; [
    helix
    onlyoffice-bin

    wget

    git
    git-crypt

    neofetch
    direnv
    glxinfo
    tree
  ];

  programs.nix-ld.enable = true;
}
