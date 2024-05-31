{ pkgs, ... }:

{
  programs.clash-verge = {
    enable = true;
    tunMode = true;
    package = pkgs.clash-verge-rev;
  };
}
