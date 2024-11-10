{
  meta ? import ../meta,
}:
{ ... }:
{
  imports = [
    ../modules
  ];

  _module.specialArgs = {
    inherit meta;
  };
}
