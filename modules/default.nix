{ ... }:

{
  imports = [
    ./packages
    ./services
    ./desktop
  ];

  _module.specialArgs = {
    meta = import ./meta;
  };
}
