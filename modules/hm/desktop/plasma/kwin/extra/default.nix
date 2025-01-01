{ moduleLib, ... }:
_:

{
  imports = moduleLib.importModules [
    ./blurplus.nix
    ./im.nix
  ];
}
