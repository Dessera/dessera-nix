{ importModules, ... }:
_: _:

{
  imports = importModules [
    ./alacritty.nix
    ./git.nix
    ./fish.nix
    ./tmux.nix
    ./vscode.nix

    ./firefox
  ];
}
