{
  meta ? import ../meta,
}:
{ ... }:
{
  imports = [
    ../modules/home-manager.nix
  ];

  _module.args = {
    inherit meta;
  };
}
