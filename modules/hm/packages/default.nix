{ mlib, ... }:
_:

{
  imports = mlib.importModules [
    ./alacritty.nix
    ./git.nix
    ./fish.nix
    ./tmux.nix
    ./vscode.nix
    ./ghostty.nix
    ./wezterm.nix
    ./konsole.nix

    ./firefox
  ];
}
