{ moduleLib, ... }:
_:

{
  imports = moduleLib.importModules [
    ./grub.nix
    ./plymouth.nix
  ];
}
