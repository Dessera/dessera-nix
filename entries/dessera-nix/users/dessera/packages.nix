{ pkgs, ... }:

{
  programs.fish = {
    enable = true;
    plugins = [
      {
        name = "pure";
        src = pkgs.fetchFromGitHub {
          owner = "pure-fish";
          repo = "pure";
          rev = "v4.11.0";
          sha256 = "1vlxa9va9j616ajbcw9amqgz43cib2vds6yd56dp3rad9wynlg7k";
        };
      }
    ];
  };

  programs.git = {
    enable = true;
    userName = "Dessera";
    userEmail = "1533653159@qq.com";
  };

  programs.vscode.enable = true;

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    firefox
    qq
    drawio
    marktext
    yesplaymusic
    # obsidian
  ];
}
