{ importModules, ... }:
{ ... }:
{ ... }:

{
  imports = importModules [
    ./gtk.nix
    ./qt.nix

    ./plasma
  ];
}
