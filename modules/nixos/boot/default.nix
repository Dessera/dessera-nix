{ mlib, ... }:
_:

{
  imports = mlib.importModules [
    ./grub.nix
    ./plymouth.nix
  ];
}
