{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    fontPackages = with pkgs; [
      source-han-sans
    ];
  };
}
