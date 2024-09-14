{ pkgs, ... }:

{
  # programs.fish = {
  #   enable = true;
  #   plugins = [

  #   ];
  # };



  programs.vscode.enable = true;

  modules.packages = {
    wpsoffice-cn = {
      enable = true;
    };
    git = {
      enable = true;
    };
    fish = {
      enable = true;
    };
  };

  programs = {
    home-manager = {
      enable = true;
    };
  };

  home.packages = with pkgs; [
    firefox
    qq
    drawio
    marktext
  ];
}
