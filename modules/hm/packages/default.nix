{ moduleLib, ... }:
_:

{
  imports = moduleLib.importModules [
    ./alacritty.nix
    ./git.nix
    ./fish.nix
    ./tmux.nix
    ./vscode.nix

    ./firefox
  ];
}
