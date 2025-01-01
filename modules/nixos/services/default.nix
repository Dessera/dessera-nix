{ moduleLib, ... }:
_:

{
  imports = moduleLib.importModules [
    ./v2ray.nix
  ];
}
