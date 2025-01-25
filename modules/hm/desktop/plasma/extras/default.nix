{ mlib, ... }:

{
  imports = mlib.importModules [
    ./kwin.nix
  ];
}
