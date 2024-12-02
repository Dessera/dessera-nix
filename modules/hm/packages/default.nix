{ importModules, ... }:
_: _:

{
  imports = importModules [
    ./git.nix

    ./firefox
    ./fish
    ./wpsoffice-cn
  ];
}
