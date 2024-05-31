{ pkgs, ... }:

{
  imports = [
    # Shell
    ../../../../common/x86_64-linux/packages/fish/user.nix
    ../../../../common/x86_64-linux/packages/alacritty/user.nix

    # Editors
    ../../../../common/x86_64-linux/packages/vscode/user.nix
    ../../../../common/x86_64-linux/packages/helix/user.nix

    # Git
    ../../../../common/x86_64-linux/packages/git/user.nix

    # Home Manager Self
    ../../../../common/x86_64-linux/packages/home-manager.nix
  ];

  home.packages = with pkgs; [
    brave
    qq
    drawio
    marktext
    motrix
    yesplaymusic
  ];
}
