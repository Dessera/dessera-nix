{ mlib, ... }:
_:

{
  imports = mlib.importModules [
    ./blurplus.nix
    ./im.nix
  ];
}
