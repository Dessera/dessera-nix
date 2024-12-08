{ importModules, ... }:
_: _:

{
  imports = importModules [
    ./git.nix
    ./fish.nix
    ./vscode.nix

    ./firefox
  ];
}
