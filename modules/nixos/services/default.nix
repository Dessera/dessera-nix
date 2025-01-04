{ mlib, ... }:
_:

{
  imports = mlib.importModules [
    ./v2ray.nix
  ];
}
